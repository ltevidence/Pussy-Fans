 class UserMailer < ApplicationMailer
  default from: 'pussyfans@yopmail.com'

  def welcome_email(user)

    @user = user
    mail(to: @user.email, subject: 'Bienvenue dans l\'univers bienveillant des chats ! 😽') 

  end

  def confirmation_email(cart)

    @cart = Cart.find params.require(:user_id)

    mail(to: @cart.user.email, subject: 'Merci pour votre achat ! 😺 ')  

  end

  #def confirmation_email(order)

   # @user = User.find(params[:user_id])

    #mail(to: 'pussyfans@yopmail.com', subject: 'Une commande vient d\'être effectuée ! 😺 ')

  #end

end