class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @flats = Flat.order('created_at DESC').limit(4)
  end
end
