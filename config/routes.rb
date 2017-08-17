Rails.application.routes.draw do

  root "application#welcome"
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
  get '/users/new' => "users#new", as: "signup"

  resources :users
  resources :attractions

end
