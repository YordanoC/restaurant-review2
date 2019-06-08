class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR city ILIKE :query"
      @restaurants = Restaurant.where(sql_query, query: "%#{params[:query]}%")
      if @restaurants.where.not(latitude: nil, longitude: nil)
        @markers = @restaurants.map do |restaurant|
        {
          lat: restaurant.latitude,
          lng: restaurant.longitude,
          infoWindow: render_to_string(partial: "infoWindow", locals: { restaurant: restaurant }),
          image_url: helpers.asset_url("https://vertoubasket.fr/assets/front/img/marker.png")
      }
        end
      end
    else
      @text_title = "Tous les restaurants"
      @restaurants = Restaurant.all
    if @restaurants.where.not(latitude: nil, longitude: nil)

    @markers = @restaurants.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: { restaurant: restaurant }),
        image_url: helpers.asset_url("https://vertoubasket.fr/assets/front/img/marker.png")
      }
    end
  end
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end
end
