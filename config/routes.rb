Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  resources :flats, only: [:index, :new, :create, :edit, :update, :destroy, :show, :index]
  resources :users, only:[:index, :show]

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
