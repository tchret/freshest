Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  get '/page', to: 'posts#page'

  root "posts#index"
  get '/sources', to: 'sources#index', as: 'sources'

  resources :sources, path: :i, as: :sources, only: [:index, :show, :create] do
    member do
      get 'follow', to: 'sources#follow', as: 'follow'
      get 'source_data', to: 'sources#source_data', as: 'data'
      get 'stop_following', to: 'sources#stop_following', as: 'stop_following'
    end
  end
  resources :posts, only: [:index]
  get '/about', to: 'pages#about', as: 'about'
  get '/suggest', to: 'sources#suggestion', as: 'suggest'
  get '/api/reading_list/all', to: 'apis#index_sources'
  get '/api/reading_list/:id', to: 'apis#reading_list'
  get '/is_follow', to: 'users#is_follow'



  mount Sidekiq::Web => '/sidekiq'
end
