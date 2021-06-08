class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'
 
  def welcome_email(user)

    @user = user 


    @url  = 'htt p://pussyfans.fr/login' 


    mail(to: @user.email, subject: 'Bienvenue !') 
  end
end