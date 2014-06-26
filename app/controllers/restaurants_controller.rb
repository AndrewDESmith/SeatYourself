class RestaurantsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @restaurant = @user.restaurants.build
    @categories = Category.all
    @cat_ids = []
  end

  def create
    if Restaurant.create(restaurant_params)
      redirect_to user_path(params[:user_id])
    else
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:id])
    @categories = Category.all
    @cat_ids = @restaurant.categories.all.inject([]){|arr, element| arr << element.id}
  end

  def update
    @user = User.find(params[:user_id])
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :user_id, :category_ids =>[])
  end
end
