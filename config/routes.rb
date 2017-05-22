Rails.application.routes.draw do



  get 'flats/new'

  get 'flats/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :flats, only: [:index, :new, :create, :edit, :update, :destroy]

    root to:'pages#home'
end

