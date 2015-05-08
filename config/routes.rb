Rails.application.routes.draw do
  devise_for :users

  resources :influencers, only: [:index, :show, :create]
  resources :posts, only: [:index]
end
