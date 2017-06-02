Rails.application.routes.draw do
  resources :posts
  resources :members
  resources :employees
  resources :wait_statuses
  resources :registrations, except: :show
  resources :sessions, except: :index

  # Set the root url
  root :to => 'home#home', as: :home

  # Authentication
  get 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login

end
