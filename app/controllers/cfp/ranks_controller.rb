require_dependency "cfp/application_controller"

module Cfp
  class RanksController < BaseController
    respond_to :json
    before_filter :check_for_reviewer, :load_proposal

    def create
      @rank = find_or_create_rank
      @rank.value = params[:value]
      @rank.save!

      render :json => @rank
    end

    private
    def find_or_create_rank
      rank = @proposal.ranks.where(:user_id => current_user.id).first
      unless rank
        rank = @proposal.ranks.build
        rank.user = current_user
      end
      rank
    end

    def check_for_reviewer
      redirect_to :proposals unless current_user.can_review?
    end

    def load_proposal
      @proposal = Proposal.find params[:proposal_id]
    end
  end
end
