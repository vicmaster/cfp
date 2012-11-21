module Cfp
  class Profile < ActiveRecord::Base
    attr_accessible :bio, :company, :name, :title

    validates :name , :presence => true
    validates :bio  , :presence => true
  end
end
