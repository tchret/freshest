Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :influencers, path: :i, as: :influencers, only: [:index, :show, :create]
  resources :posts, only: [:index]
end
