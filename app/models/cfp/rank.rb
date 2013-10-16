module Cfp
  class Rank < ActiveRecord::Base
    belongs_to :user
    validates :value, :inclusion => { :in => Proposal::RANK_SCALE }

    def self.for_proposal_user(proposal, user)
      ranks = proposal.ranks.where(:user_id => user.id)
      ranks.empty? ? nil : ranks.first
    end
  end
end
