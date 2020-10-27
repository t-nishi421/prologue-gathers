Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :new, :create, :edit, :update, :show] do
    member do
      get 'search/user', to: 'books#search_userid', as: 'search_userid'
      get 'rental', to: 'books#rental', as: 'rental'
      get 'return', to: 'books#return', as: 'return'
    end
    collection do
      get 'search'
      post 'save-sentence', to: 'books#save_sentence', as: 'save_sentence', defaults: { fomat: 'json'}
    end
  end

  root "books#index"

  resources :users, only: [:edit, :update, :show] do
    member do
      get 'sentences', to: 'users#sentences', as: 'sentences'
    end
  end
end
