class ReservationsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.build
  end

  def create
    #binding.pry
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      p @reservation.restaurant
      redirect_to restaurant_path(@reservation.restaurant)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
    if params[:restaurant_id]
      @restaurant = Restaurant.find(params[:restaurant_id])
      @reservations = @restaurant.reservations.all
      @title = "Reservation List for restaurant #{@restaurant.name}"
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @reservations = @user.reservations.all
      @title = "Reservation List for user #{@user.email}"
    end
  end

private
def reservation_params
  params.require(:reservation).permit(:start_time,:seats,:restaurant_id)
end

end
