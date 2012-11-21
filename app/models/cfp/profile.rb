module Cfp
  class Profile < ActiveRecord::Base
    attr_accessible :bio, :company, :name, :title, :user_id
  end
end
