class InvitationMailer < ApplicationMailer
  def invitation_email(user)
    @user = user
    # @registration_path = APP_CONFIG['url_login']
    @registration_path = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Invitation to register')
  end
end
