class FlatsController < ApplicationController
  before_action :find_flat, only: [:show]

  def index
    @flatz = Flat.all
    # binding.pry
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user

    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms, :category, :photo)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

end
