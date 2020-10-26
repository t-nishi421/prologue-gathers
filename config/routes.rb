Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :new, :create, :edit, :update, :show] do
    collection do
      get 'search'
      get 'search/user-id/:id', to: 'books#search_userid', as: 'search_userid'
      post 'save-sentence', to: 'books#save_sentence', as: 'save_sentence', defaults: { fomat: 'json'}
    end
  end

  get '/books/rental/:id', to: 'books#rental', as: 'rental'
  get '/books/return/:id', to: 'books#return', as: 'return'
  root "books#index"

  resources :users, only: [:edit, :update, :show]
end
