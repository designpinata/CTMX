Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: 'dashboard#index'
    get '/dashboard', to: 'dashboard#dashboard', as: :dashboard
    resources :totems, param: :slug do
      resources :tips, only: [:show, :edit, :update, :destroy], param: :id
      resources :instagrams, only: [:show, :edit, :update, :destroy], param: :id
      collection do
        patch :sort
      end
      member do
        get :update_instagram
      end
    end
    resources :circuits, param: :slug
    resources :polls, only: [:index, :show, :edit, :update, :destroy]
    resources :pages, param: :slug
    resources :users
    resources :images
  end

  root to: 'pages#home'
  get '/sitemap', to: 'pages#sitemap', as: :sitemap
  resources :pages, only: [:show], path: '/', param: :slug
  resources :polls, only: [:create]
  resources :circuits, only: [:show], param: :slug do
    member do
      get :discover
    end
    resources :totems, only: [:show], param: :slug do
      member do
        post :tip
      end
    end
  end
  get '/:circuit_shortcut/:totem_shortcut', to: 'totems#shortcut', as: :totem_shortcut
end
