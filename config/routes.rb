Rails.application.routes.draw do
  resources :members
  resources :employees
  resources :employees
  resources :employees
  resources :employees
  resources :employees
  resources :wait_statuses
  resources :registrations
  resources :wait_statuses
  resources :members

  # Set the root url
  root :to => 'home#home' 

  # Authentication
  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

end
