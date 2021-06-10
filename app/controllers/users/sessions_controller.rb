# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

   #GET /resource/sign_in
   def new
     super
   end

   #POST /resource/sign_in
   def create
     super
     @cart_to_create = current_user.build_cart
     @cart_to_create.save
   end

   #DELETE /resource/sign_out
   def destroy
     #@current_user = User.find(current_user.id)
     @cart_to_destroy = current_user.cart
     if (@cart_to_destroy)
       @cart_to_destroy.destroy
     end
     super
   end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
