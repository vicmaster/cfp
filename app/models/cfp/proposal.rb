module Cfp
  class Proposal < ActiveRecord::Base
    attr_accessible :title, :abstract, :tags, :level

    belongs_to :user

    validates :title, :presence => true
    validates :abstract, :presence => true
  end
end
