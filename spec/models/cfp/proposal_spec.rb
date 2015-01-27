require "spec_helper"

describe Cfp::Proposal do
  let (:user) do
    user =  User.new
    user.roles = []
    user
  end

  describe "#can_be_edited_by?" do
    context "CFP is open" do
      before { Cfp::Config.stub(:call_for_papers_state).and_return "open" }

      context "can be seen by user" do
        before do
          subject.should_receive(:can_be_seen_by?).
              with(user).
              and_return(true)
        end

        specify do
          expect(subject.can_be_edited_by?(user)).to be_true
        end
      end

      context "can't be seen by user" do
        before do
          subject.should_receive(:can_be_seen_by?).
              with(user).
              and_return(false)
        end

        specify do
          expect(subject.can_be_edited_by?(user)).to be_false
        end
      end
    end

    context "CFP is closed" do
      before { Cfp::Config.stub(:call_for_papers_state).and_return "closed" }

      specify { expect(subject.can_be_edited_by?(user)).to be_false }
    end
  end

  describe "#can_be_seen_by?" do
    context "user is the owner" do
      before { subject.user = user }

      specify { expect(subject.can_be_seen_by?(user)).to be_true }
    end

    context "user is an admin" do
      before { user.stub(:is_admin?).and_return true }

      specify { expect(subject.can_be_seen_by?(user)).to be_true }
    end

    context "user has no relation to proposal" do
      specify { expect(subject.can_be_seen_by?(user)).to be_false }
    end
  end

  describe ".scoped_for(user)" do
    context "user can review" do
      before { user.stub(:can_review?).and_return true }

      it "returns all proposals" do
        scoped = double
        subject.class.should_receive(:all).and_return(scoped)
        expect(subject.class.scoped_for(user)).to be scoped
      end
    end

    context "regular user" do
      it "returns only his proposals" do
        results = double
        user.should_receive(:proposals).and_return results
        expect(subject.class.scoped_for(user)).to be results
      end
    end
  end

  describe "#average_ranking" do
    it "returns the AR average for the value column on all proposal rankings" do
      rankings = double
      rankings.should_receive(:sum).with(:value)
      subject.stub(:ranks).and_return rankings

      subject.average_ranking
    end
  end
end
