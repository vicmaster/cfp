module Cfp
  class Proposal < ActiveRecord::Base
    RANK_SCALE = (0..2).to_a
    TALK_LEVEL = %w(begginner intermediate advanced)

    attr_accessible :title, :abstract, :tags, :level

    belongs_to :user, :class_name => "::User"
    has_many :comments
    has_many :ranks

    validates :title, :presence => true
    validates :abstract, :presence => true

    delegate :email, :to => :user, :prefix => true

    def self.scoped_for(user)
      case
      when user.can_review?
        scoped
      else
        user.proposals
      end
    end

    def can_be_edited_by?(user)
      Cfp::Config.cfp_open? && ((self.user == user) || (user.is_admin?))
    end

    def average_ranking
      ranks.average(:value)
    end
  end
end
