 class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Bienvenue dans l\'univers bienveillant des chats ! 😽') 

  end

  def confirmation_email(order)

    @order = order
    @user = User.find(order.user_id)
    @cart = @user.cart

    mail(to: @user.email, subject: 'Merci pour votre achat ! 😺 ') 
    mail(to: 'pussyfans@yopmail.com', subject: 'Une commande vient d\'être effectuée ! 😺 ') 

  end
end