Rails.application.routes.draw do
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  mount Attachinary::Engine => "/attachinary"

  resources :flats, only: [:index, :new, :create, :edit, :update, :destroy, :show, :index] do
    post 'send_email_to_owner', to: 'flats#send_email_to_owner'
  end

  resource :profile, only: :show

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
