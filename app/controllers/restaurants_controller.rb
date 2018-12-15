class RestaurantsController < ApplicationController
  respond_to :json 
	def index
		@restaurants = Restaurant.text_search(params[:query]).page(params[:page])
    @rests = Restaurant.all
    gon.rest = Restaurant.all
    @searchRest = Restaurant.text_search(params[:query])

  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def script_action
  render 'restbookings.js.erb'
  @restaurants = Restaurant.all
end

  def new
    @restaurant = Restaurant.new
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.rate = 0
    if @restaurant.save
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.reviews.each(&:destroy)
    @restaurant.destroy

    redirect_to restaurant_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :descr, :mainPhoto, :addr, :rate)
  end
end
