Rails.application.routes.draw do
  namespace :api do
    root to: "api#index"
    resources :users, :group_queues, :songs, :votes
  end
end
