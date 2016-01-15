Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'welcome#index'
  end

  resources :bourbons do
    resources :reviews
  end

  resources :reviews do
    resources :votes do
      collection do
        post 'upvote'
        post 'downvote'
      end
    end
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :bourbons, only: [:index, :edit, :update]
  end

  namespace :api do
    namespace :v1 do
      resources :votes do
        collection do
          post 'upvote'
          post 'downvote'
        end
      end
    end
  end
end
