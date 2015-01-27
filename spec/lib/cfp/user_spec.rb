require "spec_helper"

describe Cfp::User do
  subject do
    user       = User.new
    user.roles = []
    user
  end

  describe "#setup_roles" do
    context "roles is nil" do
      before do
        subject.roles = nil
      end

      it "sets it as []" do
        subject.setup_roles
        expect(subject.roles).to eq []
      end
    end

    context "roles has something" do
      before do
        subject.roles = [1, 2, 3]
      end

      it "leaves the original value" do
        expect(subject.roles).to eq [1, 2, 3]
      end
    end
  end

  describe "#can_review?" do
    context "user has 'reviewer' role" do
      before { subject.roles = [:reviewer] }

      it "returns true" do
        expect(subject.can_review?).to be true
      end
    end

    context "user doesn't have 'reviewer' role" do
      before { subject.roles = [] }

      it "returns false" do
        expect(subject.can_review?).to be false
      end
    end
  end

  describe "#is_admin?" do
    context "has the admin role" do
      before { subject.roles = [:admin] }
      specify { expect(subject.is_admin?).to be true }
    end

    context "has no admin role" do
      specify { expect(subject.is_admin?).to be false }
    end
  end

  describe "#should_create_profile?" do
    context "the user is reviewer" do
      before  { subject.roles = [:reviewer] }
      specify { expect(subject.should_create_profile?).to be false }
    end

    context "the user is admin" do
      before  { subject.roles = [:admin] }
      specify { expect(subject.should_create_profile?).to be false }
    end

    context "user has profile" do
      before { subject.profile = Cfp::Profile.new }
      specify { expect(subject.should_create_profile?).to be false }
    end

    specify { expect(subject.should_create_profile?).to be true }
  end

  describe "#make_reviewer" do
    context "user is not reviewer" do
      before do
        subject.roles = []
        expect(subject).to receive :save
        subject.make_reviewer
      end

      specify { expect(subject.roles).to eq [ :reviewer ] }
    end

    context "user is reviewer" do
      before do
        subject.roles = [ :reviewer ]
        expect(subject).not_to receive :save
        subject.make_reviewer
      end

      specify { expect(subject.roles).to eq [ :reviewer ] }
    end
  end
end
