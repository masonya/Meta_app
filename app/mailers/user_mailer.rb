class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'

  def welcome_email
    #@user = params[:user]
    @user = User.find params.require(:user_id)
    @inheritor = @user.inheritor_id
    @url  = 'http://example.com/login'
    mail(to: @inheritor.email, subject: 'Welcome to My Awesome Site')
  end
end
#mail(to: @user.email, subject: 'Welcome to My Awesome Site')
