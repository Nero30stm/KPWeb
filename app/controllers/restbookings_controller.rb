class RestbookingsController < ApplicationController
	respond_to :json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restbooking = @restaurant.restbookings.create(restbooking_params)
    redirect_to restaurant_path(@restaurant)
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
      @restbookings = @restaurant.restbookings.all
      gon.restbook = @restaurant.restbookings.all
    end

  private
    def restbooking_params
      params.require(:restbooking).permit(:requested_date, :user_name, :email)
    end
end
