module Cfp
  class Notifications < ActionMailer::Base
    default from: "cfp@magmaconf.com"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.notifications.comment_sent.subject
    #
    def comment_sent(comment)
      users = ::User.all.select {|user| user.is_admin? || user.can_review?}
      bcc = users.map {|user| user.email}
      @comment = comment
      @who_name = comment.user.profile.name
      mail bcc: bcc, subject: 'CFP MagmaConf - New comment'
    end
  end
end
