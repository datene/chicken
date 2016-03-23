Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'challenges#new'

  get '/about', to: 'pages#about'

  resource :dashboard, only: [:show]

  resources :challenges, except: [:index] do
    resources :messages, only: [:index, :new, :create, :destroy]
    resources :checkpoints, only: [:index]
    resources :logged_times, only: [:new, :create]
    
    member do
      patch :accept
      patch :decline
      patch :concede
    end
  end


end
