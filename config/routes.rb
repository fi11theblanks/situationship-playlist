Rails.application.routes.draw do
  get "situationships/new"
  get "situationships/create"
  get "situationships/show"
  get "sessions/create"
  get "sessions/destroy"
  get "sessions/failure"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  Rails.application.routes.draw do
  get "situationships/new"
  get "situationships/create"
  get "situationships/show"
  get "sessions/create"
  get "sessions/destroy"
  get "sessions/failure"
  get "/auth/spotify/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"

  resources :situationships, only: [ :new, :create, :show ]

  root "situationships#new"
end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
