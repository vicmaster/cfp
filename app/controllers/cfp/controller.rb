class Cfp::Controller < ::ApplicationController
  before_filter :check_for_profile, :set_locale
  layout 'cfp/application'

  def check_for_profile
    if current_user
      redirect_to new_profile_path if current_user.should_create_profile?
    end
  end

  def set_locale
    I18n.locale = current_user.profile.locale if current_user && current_user.profile
  end
end
