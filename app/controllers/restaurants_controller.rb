class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  def new
    @restaurant = Restaurant.new(params[:restaurant])
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant 
    else
      render 'new'
    end    
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to @restaurant 
    else
      render 'edit'
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to restaurants_path
  end

  private

    def restaurant_params
      params.require(:restaurant).permit(:name, :desc, :address, :phone, :image, :remote_image_url)
    end
end
