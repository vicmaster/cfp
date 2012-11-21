module Cfp
  class ProfilesController < Controller
    skip_before_filter :check_for_profile

    def new

    end
  end
end
