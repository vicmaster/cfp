# encoding: utf-8

module Cfp
  class Proposal < ActiveRecord::Base
    RANK_SCALE = (0..5).to_a
    TALK_LEVEL = %w(beginner intermediate advanced)
    LANGUAGE   = %w(English Español)

    belongs_to :user, class_name: "::User"
    has_many :comments
    has_many :ranks
    scope :approved, -> { where(approved: true) }

    validates :title       , presence: true
    validates :abstract    , presence: true
    validates :description , presence: true

    validates :title    , length: { maximum: 255 }
    validates :level    , length: { maximum: 255 }
    validates :language , length: { maximum: 255 }
    validates :tags     , length: { maximum: 255 }

    delegate :email , to: :user , prefix: true
    delegate :name  , to: :user , prefix: true
    delegate :bio   , to: :user , prefix: true

    def self.scoped_for(user)
      case
      when user.can_review?
        all
      else
        user.proposals
      end
    end

    def can_be_edited_by?(user)
      Cfp::Config.cfp_open? && can_be_seen_by?(user)
    end

    def can_be_seen_by?(user)
      (self.user == user) || (user.is_admin?)
    end

    def average_ranking
      ranks.sum(:value)
    end

    def description_html
      Cfp::Proposal.renderer.render(self.description).html_safe
    end

    def abstract_html
      Cfp::Proposal.renderer.render(self.abstract).html_safe
    end

    def self.renderer
      @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                             autolink: true,
                                             space_after_headers: true)
    end
  end
end
