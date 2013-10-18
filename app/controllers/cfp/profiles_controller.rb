module Cfp
  class ProfilesController < BaseController
    skip_before_filter :check_for_profile, :except => [ :show ]
    before_filter :load_profile, :only => [ :edit, :update ]

    def new
      @profile = Cfp::Profile.new
    end

    def create
      @profile = Profile.new profile_params
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

    def edit
    end

    def update
      #if @profile.update_attributes params[:profile]
      if @profile.update_attributes profile_params
        redirect_to :profile, :notice => t('profile.edited.success')
      else
        render :action => :edit
      end
    end

    private
    def load_profile
      @profile = current_user.profile
    end

    private
    def profile_params
      params.require(:profile).permit :bio, :company, :name, :title, :locale
    end
  end
end
