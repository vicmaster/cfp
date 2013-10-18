class Cfp::Config < ActiveRecord::Base
  include Persistent::Settings

  def self.cfp_open?
    call_for_papers_state == "open"
  end
end
