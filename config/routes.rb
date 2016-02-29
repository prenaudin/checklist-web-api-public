Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :api, path: '/api', defaults: { format: :json } do

    mount_devise_token_auth_for 'User', at: 'auth'
    get :me, to: 'users#me'

    resources :projects, only: [:index, :show, :create, :update, :destroy] do
      resources :checklists, only: [:index, :show, :create, :update, :destroy] do
        member do
          post 'share',   action: :share
          post 'unshare', action: :unshare
          post 'copy',    action: :copy
        end

        resources :versions, only: [:create, :update, :destroy]
      end
    end

    root 'base#up'
    get '*unmatched_route', to: 'base#not_found'
  end

  root 'home#index'
  get '*unmatched_route', to: 'home#index'
end
