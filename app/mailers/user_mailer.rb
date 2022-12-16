class UserMailer < Devise::Mailer
  default from: 'terra_green@yopmail.com'
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Bienvenue sur Terragreen')
  end

  def reset_password_instructions(record, token, opts = {})
    super
  end
end
