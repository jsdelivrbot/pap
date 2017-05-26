class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only: [:show, :edit, :update]

  def index

    # request.ip

    tmp = FlatFilter.new(params).filter("Lyon", 50)

    @flat = Flat.new
    @flats = tmp[:items]

    @filters = tmp[:tags]

    # GEOCODING
    @hash = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.infowindow render_to_string(:partial => "infowindow", :locals => { :flat => flat})
      marker.lat flat.latitude
      marker.lng flat.longitude
      marker.title flat.title
      # marker.picture({
      #             :url   => "http://lorempixel.com/400/200/",
      #             :width  => "32",
      #             :height => "32"
      #            })
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



