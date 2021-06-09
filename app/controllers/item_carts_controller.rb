class OrdersController < ActionController::Base
  layout "application"
  before_action :authenticate_user!, only: [:create]

  def index
    @items_of_cart = ItemCart.all
  end

  def show
    @items_of_cart = ItemCart.find(params[:id])
  end

  def create
    @item = Item.find(params[:item_id])
    @cart = current_user.cart
    @items_of_cart = ItemCart.new(item: @item, cart: @cart)
    if (@items_of_cart.save)
      flash[:success] = "Bravo la photo n°#{@item.id} a bien été ajouté au panier"
      render 'items#index'
    else
      redirect_to root_path, :locals => {:sucess_message => nil, :message_failure => "Nous n'avons pas réussi à créer  pour la (ou les) raison(s) suivante(s) :"}
    end

  end

  private

  def orders_params
    @order.permit(:cart_id, :item_id)
  end
end




