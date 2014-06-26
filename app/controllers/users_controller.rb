class UsersController < ApplicationController
  before_action :ensure_logged_in, :only=>[:show]
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user
      redirect_to user_path(@user), notice: "Logged in"
    else
      flash[:alert] = "Fail to create new user"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @restaurants = @user.restaurants.all
    p @restaurants
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,:is_restaurant_owner)
  end
end
