Rails.application.routes.draw do
  resources :appointments, only: [:new, :create, :show, :edit, :update]
  resources :dogs, only: [:new, :create, :show, :edit, :update]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
