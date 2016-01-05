Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'static_pages#index'
    # delete 'sign_out', to: 'devise/sessions#destroy',
    # as: :destroy_user_session
  end
end
