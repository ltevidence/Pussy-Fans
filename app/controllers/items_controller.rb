class ItemsController < ActionController::Base
  layout "application"

  def index
    @items = Item.all
  end
end
