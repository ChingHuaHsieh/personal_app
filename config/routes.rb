Rails.application.routes.draw do
  devise_for :users

  root 'signup#index'

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'done'
    end
  end

  resources :posts, only: [:index] do
    collection do
      get 'user_info'
    end
  end
end
