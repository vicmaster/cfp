module Cfp
  module User
    def self.included(base)
      base.send(:before_validation, :setup_roles)
      base.send(:has_many, :proposals, :class_name => "Cfp::Proposal")
      base.send(:serialize, :roles)
      base.send(:extend, ClassMethods)
    end

    def setup_roles
      self.roles ||= []
    end

    def can_review?
      roles.include?(:reviewer)
    end

    module ClassMethods

    end
  end
end
