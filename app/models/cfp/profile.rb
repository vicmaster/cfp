module Cfp
  class Profile < ActiveRecord::Base
    LOCALES = ['en', 'es']

    validates :name    , presence: true
    validates :name    , length: { maximum: 255 }
    validates :title   , length: { maximum: 255 }
    validates :company , length: { maximum: 255 }

    validates :locale , presence: true
    validates :locale , inclusion: { in: LOCALES }
  end
end
