require_dependency "cfp/application_controller"

module Cfp
  class CommentsController < ApplicationController
    before_filter :load_proposal
    before_filter :check_for_reviewer

    def index
  		@comments = @proposal.comments
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = @proposal.comments.build(params[:comment])
      @comment.user = current_user
      if @comment.save
        redirect_to proposal_comments_path(@proposal)
      else
        render :action => :new
      end
    end

    private
    def load_proposal
      @proposal = Proposal.find(params[:proposal_id])
    end

    def check_for_reviewer
      redirect_to :proposals unless current_user.can_review?
    end
  end
end
