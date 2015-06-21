Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  root "posts#index"
  get '/sources', to: 'sources#index', as: 'sources'

  resources :sources, path: :i, as: :sources, only: [:index, :show, :create] do
    member do
      get 'follow', to: 'sources#follow', as: 'follow'
      get 'stop_following', to: 'sources#stop_following', as: 'stop_following'
    end
  end
  resources :posts, only: [:index]
  get '/api/reading_list/all', to: 'apis#index_sources'
  get '/api/reading_list/:id', to: 'apis#reading_list'



  mount Sidekiq::Web => '/sidekiq'
end
