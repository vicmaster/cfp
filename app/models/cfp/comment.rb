module Cfp
  class Comment < ActiveRecord::Base

    validates :body, :presence => true

    belongs_to :proposal
    belongs_to :user, :class_name => "::User"

    delegate :email, :to => :user

    after_save :notify_reviewers

    def notify_reviewers
      Notifications.comment_sent(self).deliver
    end

  end
end
