Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :tasks, only: [:index, :create, :update, :destroy]
  resources :completed_tasks, only: [:index]


  get "/sign_up" => "users#new", as: :sign_up
  get "/sign_in" => "sessions#new", as: :sign_in
  get "/sign_out" => "sessions#destroy", as: :sign_out
  root 'tasks#index'



end
