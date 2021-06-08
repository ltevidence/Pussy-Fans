class OrdersController < ActionController::Base
  layout "application"

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private 

  def orders_params
    @order.permit(:cart_id, :item_id)
  end
end




