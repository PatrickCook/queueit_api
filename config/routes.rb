Rails.application.routes.draw do
  root to: "api#index"

  post 'authenticate', to: 'authentication#authenticate'

  resources :users, only: [:index, :create, :update, :destroy]

  resources :group_queues, only: [:index, :create, :update, :destroy] do
    post "/join", to: "groups#join"
    post "/leave", to: "groups#leave"
    
    resources :songs, only: [:index, :create, :destroy] do
      post "/upvote", to: "votes#create"
      delete "/downvote", to: "votes#destroy"
    end
  end
end
