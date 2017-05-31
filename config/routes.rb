Rails.application.routes.draw do
  resources :members
  resources :employees
  resources :wait_statuses
  resources :registrations, except: :show
  resources :sessions

  # Set the root url
  root :to => 'home#home'

  # Authentication
  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

end
