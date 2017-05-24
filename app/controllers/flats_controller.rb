class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_flat, only: [:show]

  def index
    @flats = FlatFilter.new(params).filter
    @flat = Flat.new
  end

  def show
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

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms, :category, photos: [] )
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

end
