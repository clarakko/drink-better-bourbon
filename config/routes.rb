Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'bourbons#index'
  end
  resources :bourbons
end
