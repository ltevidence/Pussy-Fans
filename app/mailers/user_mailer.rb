class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'
 
  def welcome_email(user)

    @user = user


    @url  = 'https://pussyfans21.herokuapp.com/users/sign_in' 


    mail(to: @user.email, subject: 'Bienvenue dans l\'univers bienveillant des chats ! 😽') 
  end
end