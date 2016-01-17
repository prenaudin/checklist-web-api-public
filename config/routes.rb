Rails.application.routes.draw do
  devise_for :user, only: []

  namespace :api, path: '/api', defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'
    resources :projects, only: [:index, :show, :create, :destroy]
    get :me, to: 'users#me'

    root 'base#up'
    get '*unmatched_route', to: 'base#not_found'
  end

  root 'home#index'
  get '*unmatched_route', to: 'home#index'
end
