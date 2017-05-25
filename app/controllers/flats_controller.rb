class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only: [:show, :edit, :update]

  def index
    @user = current_user
    if user_signed_in?
      lat_ln_string = "#{@user.latitude} #{@user.longitude}"
    else
      lat_ln_string = "16.7713828, -3.0254891"
    end

    tmp = FlatFilter.new(params).filter(lat_ln_string, 1000000)
    # Optional parameter to methode filter('address', distance) => filter('69004', 10) # 10 pour 10km around the target
    # Optional parameter to methode filter('latitude longitude', distance) => filter('69004', 10)
    @flat = Flat.new
    @flats = tmp[:items]
    @filters = tmp[:tags]

    # GEOCODING
    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
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
  end

  def update
    @flat.update(flat_params)
    redirect_to profile_path
  end


  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to profile_path
  end

  def send_email_to_owner
    owner = Flat.find(params[:flat_id]).user
    content = params[:mail_content]
    UserMailer.contact_flat_owner(owner, content).deliver_now
    flash[:notice] = "Email successfully sent"
    redirect_to :back
  end


  private

  def flat_params
    params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms, :category, photos: [] )
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end
end

