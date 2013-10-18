module Cfp
  class Profile < ActiveRecord::Base
    LOCALES = ['en', 'es']

    validates :name   , :presence => true
    validates :bio    , :presence => true
    validates :locale , :presence => true
  end
end
