Rails.application.routes.draw do
  root to: "homes#index"
  resources :tasks
  resources :users, only: [:new, :create, :edit, :update]
  resource :session, only: [:new, :create, :destroy]
end