Rails.application.routes.draw do
  get 'events/index'

  get 'events/show'

  get 'events/new'

  get 'events/create'

  get 'events/edit'

  get 'events/update'

  get 'events/destroy'

  get 'events/set_event'

  get 'events/event_params'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }


  mount Attachinary::Engine => "/attachinary"

  resources :flats, only: [:index, :new, :create, :edit, :update, :destroy, :index]

  resources :flats, only: [:show] do
    post 'send_email_to_owner', to: 'flats#send_email_to_owner'
  end

  resource :profile, only: :show

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
