Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: [:show]

  root 'prototypes#index'

  resources :prototypes do
    collection do
      get 'newest'
      get 'popular'
    end
  end

  resources :comments,   only: [:new, :create]
  resources :tags,       only: [:index, :show], param: :tag_name
  resources :likes,      only: [:create, :destroy]

end
