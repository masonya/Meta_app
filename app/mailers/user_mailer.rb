class UserMailer < ApplicationMailer
  default from: "user1@meta.ru"

  def welcome_email
    @inheritor = AccountTransfer.last.inheritor_email
    @url  = 'http://localhost:3331/obtain'
    mail(to: @inheritor, subject: 'You have been given an inheritance!')
  end
end
