Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts/drafts#index"

  resource :registration, only: %i[ new create ]
  resource :session
  resources :passwords, param: :token

  resources :reportings, only: %i[ new create ]

  resource :user, only: %i[ edit update destroy ]
  resources :posts, except: %i[ index show ] do
    resources :broadcasts, module: :posts, only: :create
  end

  scope module: :posts do
    resources :drafts, only: :index
    resources :archives, only: :index
  end

  resources :authors, path: "", param: :slug, only: [] do
    resources :posts, path: "", param: :slug, only: %i[ index show ]
    resources :subscribers, param: :token, only: %i[ create ] do
      get :confirmed
      get :unsubscribe
    end
  end
end
