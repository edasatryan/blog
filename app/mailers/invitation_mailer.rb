class InvitationMailer < ApplicationMailer
  def invitation_email(user)
    @user = user
    # @registration_path = APP_CONFIG['url_login']
    @registration_path = 'http://0.0.0.0:3000/users/'
    mail(to: @user.username, subject: 'Invitation to register')
  end
end
