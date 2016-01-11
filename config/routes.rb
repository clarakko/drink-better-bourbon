Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'bourbons#index'
  end

  resources :bourbons, except: [:destroy] do
    resources :reviews
  end

  namespace :admin do
    resources :bourbons, only: [:index, :show, :destroy]
    resources :reviews, only: [:destroy]
  end
end
