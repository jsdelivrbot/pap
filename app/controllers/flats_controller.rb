class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only: [:show]

  def index
    @flats = FlatFilter.new(params).filter('45.764043 4.835658999999964', 10)
    # Optional parameter to methode filter('address', distance) => filter('69004', 20) # 20 pour 20km around the target
    # Optional parameter to methode filter('latitude longitude', distance) => filter('69004', 20)

    @flat = Flat.new

    # GEOCODING
    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
    # GEOCODING
  end

  def show
    @flat = Flat.find(params[:id])

    # GEOCODING
    @flats_lat = Flat.where(id:@flat)
    @hash = Gmaps4rails.build_markers(@flats_lat) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
    # GEOCODING
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.availability = true
    @flat.user = current_user

    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @edit = Flat.update(flat_params)
    redirect_to profile_path
  end


  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to profile_path
  end


  private

  def flat_params
    params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms, :category, photos: [] )
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end

