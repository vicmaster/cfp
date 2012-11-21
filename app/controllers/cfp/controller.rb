class Cfp::Controller < ::ApplicationController
  before_filter :check_for_profile
  layout 'cfp/application'

  def check_for_profile
    redirect_to new_profile_path if current_user && current_user.should_create_profile?
  end
end
