class ItemsController < ActionController::Base
  layout "application"

  def index
    @items = Item.all
  end


  def show
    @item = Item.find(params[:id])
  end

end
