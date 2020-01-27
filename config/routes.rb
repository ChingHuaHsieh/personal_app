Rails.application.routes.draw do

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    # For details on the DSL available within this file, see 
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create]
      member do
        get 'user_info'
        post 'a_card_create'
      end
    end
  end

  devise_for :users

  root 'signup#index'

  resources :signup, only: [:index, :create] do
    collection do
      get 'registration'
      get 'done'
    end
  end

  # resources :posts, only: [:index, :new, :create, :show] do
  #   resources :comments, only: [:create]
  #   member do
  #     get 'user_info'
  #     post 'a_card_create'
  #   end
  # end

  resources :comments, only: [:destroy]

end
