Rails.application.routes.draw do

  root to: 'application#home'

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'

  resources :rides
  resources :attractions
  resources :users
end
