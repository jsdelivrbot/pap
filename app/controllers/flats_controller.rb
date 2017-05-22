class FlatsController < ApplicationController
  before_action :find_flat, only: [:show]

  def index
    @flats = Flat.where(area: params[:area], zip: params[:zip], price: params[:price])
    @flat = Flat.new
  end

  def show
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:title, :description, :area, :address, :zip, :price, :availability, :rooms, :category, :users_id)
  end

  def filter

  end

end
