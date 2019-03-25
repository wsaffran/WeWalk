Rails.application.routes.draw do
  resources :appointments
  resources :dogs
  resources :users, only: [:show, :edit, :update, :delete]

  get '/login', to: 'sessions#new', as: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
