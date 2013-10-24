class Cfp::BaseController < ::ApplicationController
  before_filter :check_for_profile, :set_locale
  layout 'cfp/application'

  def check_for_profile
    redirect_to new_profile_path if current_user && current_user.should_create_profile?
  end

  def set_locale
    I18n.locale = current_user.profile.locale if current_user && current_user.profile
  end

  def cfp_open?
    Cfp::Config.cfp_open?
  end
  helper_method :cfp_open?
end
