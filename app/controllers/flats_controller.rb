class FlatsController < ApplicationController

  def index
    @flats = Flat.all
  end


  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(params_flat)
    @flat.user = current_user
    binding.pry
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end


  private
    def params_flat
      params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms)
    end
end




