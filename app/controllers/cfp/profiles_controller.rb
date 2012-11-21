module Cfp
  class ProfilesController < Controller
    skip_before_filter :check_for_profile

    def new
      @profile = Cfp::Profile.new
    end

    def create
      @profile = Cfp::Profile.new(params[:profile])
      if @profile.save
        current_user.profile = @profile
        current_user.save
        redirect_to :profile
      else
        render :action => :new
      end
    end

    def show
      @profile = current_user.profile
    end
  end
end
