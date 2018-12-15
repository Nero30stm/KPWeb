class PhotoalbumsController < ApplicationController
  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
      @photoalbums = @restaurant.photoalbums.all
      gon.photoalbum = @restaurant.photoalbums.all
    end

  private
    def restbooking_params
      params.require(:photoalbum).permit(:photo, :descr)
    end
end
