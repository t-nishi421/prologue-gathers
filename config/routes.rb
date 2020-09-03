Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      get 'search'
    end
  end
  get '/books/rental/:id', to: 'books#rental', as: 'rental'
  get '/books/return/:id', to: 'books#return', as: 'return'
  root "books#index"
  resources :users, only: [:edit, :update]
end
