class UserMailer < ApplicationMailer
  default from: "terra_green@yopmail.com"
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/'
    mail(to: @user.email, subject: 'Bienvenue sur Terragreen')
  end
end
