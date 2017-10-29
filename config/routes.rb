Rails.application.routes.draw do
  get 'home/index'

  resources :secret_codes do
    collection do
      post :generate
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    authenticated do
      root to: "home#index", as: 'authenticated_root'
    end
  end

  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
