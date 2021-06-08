class UsersController < ActionController::Base
  layout "application"

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.save
  end

  private 

  def users_params
    @user.permit(:title, :description, :price, :image_url)
  end

end
