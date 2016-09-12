Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :comments

  resources :up_votes, only: :create
  resources :down_votes, only: :create
  root to: "posts#index"
end
