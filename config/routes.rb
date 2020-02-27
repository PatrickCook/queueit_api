Rails.application.routes.draw do
  root to: "api#index"

  # PUBLIC ROUTES
  post 'users', to: "users#create"
  post 'authenticate', to: 'authentication#authenticate'

  # PRIVATE ROUTES
  resources :users, only: [:index, :show, :update, :destroy]

  resources :groups, only: [:index, :create, :show, :update, :destroy] do
    post "join", to: "groups#join"
    post "leave", to: "groups#leave"

    resources :songs, only: [:index, :create, :show, :destroy] do
      post "upvote", to: "votes#create"
      delete "downvote", to: "votes#destroy"
    end
  end
end
