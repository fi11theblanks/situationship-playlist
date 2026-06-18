Rails.application.routes.draw do
  get "/auth/spotify/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"

  resources :situationships, only: [ :new, :create, :show ] do
    member do
      post :save_to_spotify
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  root "situationships#new"
end
