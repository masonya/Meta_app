class UserMailer < ApplicationMailer
  # default from: 'notifications@example.com'

  def welcome_email
    #@user = params[:user]
    @inheritor = User.find(params[:inheritor_id])
    #@user = User.find params.require(:user_id)
    #@inheritor = @user.inheritor_id
    @url  = 'http://example.com/login'
    mail(to: @inheritor.inheritor_email, subject: 'Welcome to My Awesome Site')
  end
end
#mail(to: @user.email, subject: 'Welcome to My Awesome Site')
