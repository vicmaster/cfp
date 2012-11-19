module Cfp
  class Proposal < ActiveRecord::Base
    attr_accessible :title, :abstract, :tags, :level

    belongs_to :user

    validates :title, :presence => true
    validates :abstract, :presence => true

    def self.scoped_for(user)
      case
      when user.can_review?
        scoped
      else
        where(:user => user)
      end
    end

    def can_be_edited_by?(user)
      (self.user == user) || (user.is_admin?)
    end
  end
end
