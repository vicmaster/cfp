require_dependency "cfp/application_controller"

module Cfp
  class ProposalsController < ApplicationController
    def index
      @proposals = Proposal.all
    end

    def new
      @proposal = Proposal.new
    end

    def create
      @proposal = Proposal.new proposal_params[:proposal]
      if @proposal.save
        redirect_to :proposals, :notice => t('proposals.created.success')
      else
        render :action => :new
      end
    end

    private
    def proposal_params
      params
    end
  end
end
