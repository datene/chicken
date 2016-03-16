Rails.application.routes.draw do
  devise_for :users
  root to: 'challenges#new'


  get '/about', to: 'pages#about'

  resource :dashboard, only: [:show]

  resources :challenges, except: [:index] do 
    resources :messages, only: [:index, :new, :create, :destroy]
    resources :checkpoints, only: [:index]
    member do 
      patch :accept
      patch :decline
      patch :concede
    end
  end

end
