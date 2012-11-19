module Cfp
  class Comment < ActiveRecord::Base
    attr_accessible :body

    validates :body, :presence => true

    belongs_to :proposal
    belongs_to :user, :class_name => "::User"

    delegate :email, :to => :user

  end
end
