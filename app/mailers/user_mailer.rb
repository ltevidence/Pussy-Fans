class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'
 
  def welcome_email(user)

    @user = user 
    @item = item


    @url  = 'http://pussyfans.fr/login' 


    mail(to: @user.email, subject: 'Bienvenue dans l\'univers bienveillant des chats ! 😽') 
  end
end