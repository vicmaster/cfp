module Cfp
  class Proposal < ActiveRecord::Base
    attr_accessible :title, :abstract, :tags, :level

    validates :title, :presence => true
    validates :abstract, :presence => true
  end
end
