class ProductsController < ApplicationController
	def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restreview = @restaurant.products.create(product_params)
    redirect_to restaurant_path(@restaurant)
  end
  def index
  	@restaurant = Restaurant.find(params[:restaurant_id])
	@product = @restaurant.products.all.page(params[:page])

  end

  private

  def product_params
    params.require(:product).permit(:name, :mainPhoto, :descr, :rate, :price)
  end
end



