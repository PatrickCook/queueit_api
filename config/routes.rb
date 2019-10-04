Rails.application.routes.draw do
  namespace :api do
    root to: "api#index"

    resources :users, only: [:index, :create, :update, :destroy]

    resources :group_queues, only: [:index, :create, :update, :destroy] do
      post "/join", to: "group_queues#join"
      delete "/leave", to: "group_queues#leave"
      resources :songs, only: [:index, :create, :destroy]
    end

    resources :songs, only: [] do
      post "/vote", to: "votes#create"
      delete "/vote", to: "votes#destroy"
    end
  end
end
