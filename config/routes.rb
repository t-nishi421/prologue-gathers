Rails.application.routes.draw do
  resources :books, only: [:index, :new, :create, :edit, :update, :show]
  root "books#index"
end
