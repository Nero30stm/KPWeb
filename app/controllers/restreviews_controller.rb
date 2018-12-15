class RestreviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restreview = @restaurant.restreviews.create(restreview_params)
    rate = 0
    @restaurant.restreviews.each do |r|
      rate += r.rate
    end
    rate /= @restaurant.restreviews.count.to_f
    @restaurant.rate = eval(format("%.2f", rate))
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  private

  def restreview_params
    params.require(:restreview).permit(:name, :descr, :rate)
  end
end
