Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'welcome#index'
  end
  resources :bourbons, except: [:destroy] do
    resources :reviews
  end
end
