class UsersController < ActionController::Base
  layout "application"
  before_action :is_profile_owner?, only: [:show]
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.all
    @order = @orders.sample
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

  def is_profile_owner?
    unless current_user.id == params[:id].to_i
      flash[:alert] = "Vous ne pouvez pas accéder au profil d'autres utilisateurs"
      redirect_back(fallback_location: root_path)
    end
  end

end
