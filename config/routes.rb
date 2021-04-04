Rails.application.routes.draw do
  get 'reservations/new'
  # resources :roomsより上に書かないとエラーになる。https://railsguides.jp/routing.html参照。
  get 'rooms/posts', to: 'rooms#posts'
  get 'users/account'

  resources :users
  
  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  post 'users/new', to: 'users#create'

  # root 'pages#home'
  root 'rooms#index'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :reservations
  post 'reservations/new', to: 'reservations#new'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
