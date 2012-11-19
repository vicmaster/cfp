require "spec_helper"

describe Cfp::Proposal do
  let (:user) do
    user =  User.new
    user.roles = []
    user
  end

  describe "#can_be_edited_by?" do
    context "user is the owner" do
      before { subject.user = user }

      specify do
        subject.can_be_edited_by?(user).should be_true
      end
    end

    context "user is an admin" do
      before do
        user.stub(:is_admin?).and_return true
      end

      specify do
        subject.can_be_edited_by?(user).should be_true
      end
    end

    context "user has no relation to proposal" do
      specify { subject.can_be_edited_by?(user).should be_false }
    end
  end

  describe ".scoped_for(user)" do
    context "user can review" do
      before { user.stub(:can_review?).and_return true }

      it "returns all proposals" do
        scoped = mock
        subject.class.should_receive(:scoped).and_return(scoped)
        subject.class.scoped_for(user).should be scoped
      end
    end

    context "regular user" do
      it "returns only his proposals" do
        results = mock
        user.should_receive(:proposals).and_return results
        subject.class.scoped_for(user).should be results
      end
    end
  end
end
