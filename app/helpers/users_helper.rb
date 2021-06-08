module UsersHelper
  def user_id(order)
    order.cart.user_id
  end 
end