Rails.application.routes.draw do
  namespace :api do
    resources :users, :group_queues, :songs, :votes
  end
end
