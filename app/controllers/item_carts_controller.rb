class ItemCartsController < ActionController::Base
  include ApplicationHelper
  layout "application"
  before_action :authenticate_user!, only: [:create]

  def index
    @items_of_cart = ItemCart.all
  end

  def show
    @current_cart = current_user.cart
    @items = @current_cart.items
  end

  def create

    @item = Item.find(params[:item_id])
    @cart = current_user.cart
    @items_of_cart = ItemCart.new(item: @item, cart: @cart)
    puts "\n\n\n#{flash_class(:success)}\n\n\n"

    if @items_of_cart.save
      flash[:success] = "Bravo la photo n°#{@item.id} a bien été ajouté au panier"
    else
      flash[:alert] = "Echec de création de l'objet due a:\n 
                      #{@items_of_cart.errors.full_messages.to_sentence}"
    end
    redirect_to root_path
  end

  private

  def item_carts_params
    @item_cart.permit(:cart_id, :item_id)
  end
end




