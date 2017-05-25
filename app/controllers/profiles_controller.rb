class ProfilesController < ApplicationController
  def show
  end

  def forgot_email
    @user = current_user.email
    UserMailer.forgot_email(user)

  end
end



def create
    @restaurant = current_user.restaurants.build(restaurant_params)

    if @restaurant.save
      RestaurantMailer.creation_confirmation(@restaurant).deliver_now
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end
