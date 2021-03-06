Rails.application.routes.draw do

  # use only necessary ones

  resources :users do
    resources :reviews, only: [:new, :create, :destroy]
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

  resources :users, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :appointments, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :dogs, only: [:new, :create, :show, :edit, :update, :destroy]

  #login
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
