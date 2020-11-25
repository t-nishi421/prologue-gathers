Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :new, :create, :edit, :update, :show] do
    member do
      get 'bookmark', to: 'books#search_bookmark', as: 'search_bookmark'
      get 'user', to: 'books#search_userid', as: 'search_userid'
      post 'rental', to: 'books#rental', as: 'rental'
      post 'return', to: 'books#return', as: 'return'
    end
    collection do
      get 'search'
      post 'save-sentence', to: 'books#save_sentence', as: 'save_sentence', defaults: { fomat: 'json'}
      post 'bookmark', defaults: { fomat: 'json'}
      post 'delete_bookmark', defaults: { fomat: 'json'}
    end
  end

  root "books#root"

  resources :users, only: [:edit, :update, :show] do
    member do
      get 'sentences', to: 'users#sentences', as: 'sentences'
    end
    collection do
      post 'sentence/delete', to: 'users#delete_sentence', as: 'delete_sentence', defaults: { fomat: 'json'}
    end
  end

  resources :texts, only: [:update], defaults: { fomat: 'json'}
end
