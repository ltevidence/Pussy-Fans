class UserMailer < ApplicationMailer
  default from: 'no-reply@pussyfans.fr'
 
  def welcome_email(user)

    @user = user 


    @url  = 'http://pussyfans.fr/login' 


    mail(to: @user.email, subject: 'Bienvenue dans l\'univers de Pussy Fans 😽') 
  end
end