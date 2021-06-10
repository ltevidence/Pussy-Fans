class ItemsController < ActionController::Base
  layout "application"

  def index
    @items = Item.all
    @item = @items.sample

  end

  def show
    
    respond_to do |format|
      @item = Item.find(params[:id])
      format.html {render 'show'}
      format.js {}
    end
  end

  def create
    puts "\n\nITEM = #{@item} #{item} #{params[:item]}\n\n"
    @cart = current_user.cart
    @order = Order.new(item: item, cart:@cart)
    render root_path(locals: { :object_created => @order, :success_message => "BRAVO JJJJJJJ" })
  end

  private 

  def items_params
    @item.permit(:title, :description, :price, :image_url)
  end

end
