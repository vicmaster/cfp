module Cfp
  class Rank < ActiveRecord::Base
    belongs_to :user
    attr_accessible :value
    validates :value, :inclusion => { :in => Proposal::RANK_SCALE }

    def self.for_proposal_user(proposal, user)
      ranks = proposal.ranks.where(:user_id => user.id).all
      ranks.empty? ? nil : ranks.first
    end
  end
end
