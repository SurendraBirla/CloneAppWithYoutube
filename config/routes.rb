Rails.application.routes.draw do
  # get 'home/index'

  resources :registrations, only: [:new,:create]
  resources :sessions, only: [:new, :create]
  get 'signout', to: 'sessions#destroy'

  resources :products , only: [:index, :new, :create, :show] 
  get 'destroy', to: 'products#destroy'
  post 'buys', to: 'buys#create'

  resources :buys, only: [:index,:cancel]

  root to: 'home#index'

end
