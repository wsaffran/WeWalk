Rails.application.routes.draw do

  resources :users do
    resources :reviews
  end
  
  root to: 'users#home'

  resources :analytics, only: [:index]


  #appointments
  get '/appointments/open', to: 'appointments#open_appointments'
  post '/appointments/open', to: 'appointments#open_appointments'
  patch '/appointments/open', to: 'appointments#status_to_scheduled'
  patch '/appointments/:id', to: 'appointments#status_to_open'
  patch '/appointments/:id/close', to: 'appointments#status_to_complete'
  delete '/appointments/:id', to: 'appointments#destroy'
  #users

  get '/users/:id/appointments', to: 'users#appointments', as: 'user_appointments'

  resources :users, only: [:show, :new, :create, :edit, :update, :delete]
  resources :appointments, only: [:new, :create, :show, :edit, :update]
  resources :dogs, only: [:new, :create, :show, :edit, :update]

  #login
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
