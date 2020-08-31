Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :new, :create, :edit, :update, :show]
  root "books#index"
  resources :users, only: [:edit, :update]
end
