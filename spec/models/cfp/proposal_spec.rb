require "spec_helper"

describe Cfp::Proposal do
  let (:user) do
    user =  User.new
    user.roles = []
    user
  end

  describe "#can_be_edited_by?" do
    context "CFP is open" do
      before { allow(Cfp::Config).to receive(:call_for_papers_state).and_return "open" }

      context "can be seen by user" do
        before do
          expect(subject).to receive(:can_be_seen_by?).
              with(user).
              and_return(true)
        end

        specify do
          expect(subject.can_be_edited_by?(user)).to be true
        end
      end

      context "can't be seen by user" do
        before do
          expect(subject).to receive(:can_be_seen_by?).
              with(user).
              and_return(false)
        end

        specify do
          expect(subject.can_be_edited_by?(user)).to be false
        end
      end
    end

    context "CFP is closed" do
      before { allow(Cfp::Config).to receive(:call_for_papers_state).and_return "closed" }

      specify { expect(subject.can_be_edited_by?(user)).to be false }
    end
  end

  describe "#can_be_seen_by?" do
    context "user is the owner" do
      before { subject.user = user }

      specify { expect(subject.can_be_seen_by?(user)).to be true }
    end

    context "user is an admin" do
      before { allow(user).to receive(:is_admin?).and_return true }

      specify { expect(subject.can_be_seen_by?(user)).to be true }
    end

    context "user has no relation to proposal" do
      specify { expect(subject.can_be_seen_by?(user)).to be false }
    end
  end

  describe ".scoped_for(user)" do
    context "user can review" do
      before { allow(user).to receive(:can_review?).and_return true }

      it "returns all proposals" do
        scoped = double
        expect(subject.class).to receive(:all).and_return(scoped)
        expect(subject.class.scoped_for(user)).to be scoped
      end
    end

    context "regular user" do
      it "returns only his proposals" do
        results = double
        allow(user).to receive(:proposals).and_return results
        expect(subject.class.scoped_for(user)).to be results
      end
    end
  end

  describe "#average_ranking" do
    it "returns the AR average for the value column on all proposal rankings" do
      rankings = double
      allow(rankings).to receive(:sum).and_return :value
      allow(subject).to receive(:ranks).and_return rankings

      subject.average_ranking
    end
  end
end
