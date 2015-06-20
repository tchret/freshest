Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"

  resources :influencers, path: :i, as: :influencers, only: [:index, :show, :create] do
    member do
      get 'follow', to: 'influencers#follow', as: 'follow'
      get 'stop_following', to: 'influencers#stop_following', as: 'stop_following'
    end
  end
  resources :posts, only: [:index]
  get '/meta', to: 'posts#get_meta', as: 'meta'
  get '/sources', to: 'influencers#index', as: 'sources'
  get '/api/reading_list/all', to: 'apis#index_sources'
  get '/api/reading_list/:id', to: 'apis#reading_list'



  mount Sidekiq::Web => '/sidekiq'
end
