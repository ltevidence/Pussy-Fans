 class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Bienvenue dans l\'univers bienveillant des chats ! 😽', content_type:"text/html") 

  end

  def confirmation_email(order)

    @order = order

    mail(to: @order.user.email, subject: 'Merci pour votre achat ! 😺 ') 

  end
end