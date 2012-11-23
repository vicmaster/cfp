module Cfp
  class Profile < ActiveRecord::Base
    LOCALES = ['en', 'es']

    attr_accessible :bio, :company, :name, :title, :locale

    validates :name   , :presence => true
    validates :bio    , :presence => true
    validates :locale , :presence => true
  end
end
