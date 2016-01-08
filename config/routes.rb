Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'bourbons#index'
  end
  resources :bourbons, except: [:destroy] do
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
end
