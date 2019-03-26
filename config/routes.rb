Rails.application.routes.draw do


  resources :users, only: [:show, :new, :create, :edit, :update, :delete]
  resources :appointments, only: [:new, :create, :show, :edit, :update]
  resources :dogs, only: [:new, :create, :show, :edit, :update]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  #appointments

  get '/appointments_open', to: 'appointments#open_appointments'
  patch '/appointments_open', to: 'appointments#status_to_scheduled'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
