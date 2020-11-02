Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :new, :create, :edit, :update, :show] do
    member do
      get 'search/bookmark', to: 'books#search_bookmark', as: 'search_bookmark'
      get 'search/user', to: 'books#search_userid', as: 'search_userid'
      post 'rental', to: 'books#rental', as: 'rental'
      post 'return', to: 'books#return', as: 'return'
    end
    collection do
      get 'search'
      get 'sort', to: 'books#sort', as: 'sort'
      get 'search/updated', to: 'books#search_updated', as: 'search_updated'
      post 'save-sentence', to: 'books#save_sentence', as: 'save_sentence', defaults: { fomat: 'json'}
      post 'bookmark', defaults: { fomat: 'json'}
      post 'delete_bookmark', defaults: { fomat: 'json'}
    end
  end

  root "books#index"

  resources :users, only: [:edit, :update, :show] do
    member do
      get 'sentences', to: 'users#sentences', as: 'sentences'
    end
    collection do
      post 'sentence/delete', to: 'users#delete_sentence', as: 'delete_sentence', defaults: { fomat: 'json'}
    end
  end
end
