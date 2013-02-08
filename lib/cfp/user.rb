module Cfp
  module User
    def self.included(base)
      base.send(:before_validation, :setup_roles)
      base.send(:has_many, :proposals, :class_name => "Cfp::Proposal")
      base.send(:has_one, :profile, :class_name => "Cfp::Profile")
      base.send(:serialize, :roles)
      base.send(:delegate, :name, :to => :profile)
      base.send(:delegate, :bio, :to => :profile)
      base.send(:extend, ClassMethods)
    end

    def setup_roles
      self.roles ||= []
    end

    def can_review?
      roles.include?(:reviewer)
    end

    def is_admin?
      roles.include?(:admin)
    end

    def make_reviewer
      unless self.roles.include? :reviewer
        self.roles << :reviewer
        self.save
      end
    end

    def should_create_profile?
      case
      when roles.include?(:admin) || roles.include?(:reviewer)
        false
      when !profile.nil?
        false
      else
        true
      end
    end

    module ClassMethods

    end
  end
end
