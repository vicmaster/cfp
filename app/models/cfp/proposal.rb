module Cfp
  class Proposal < ActiveRecord::Base
     attr_accessible :title, :abstract, :tags, :level
  end
end
