Danjose::Application.routes.draw do
  resources :guesses


  resources :photos

  get "/tracks" => "photos#tracks"

  match "/home/goodbye" => "home#goodbye"
  match "/home" => "home#index"

  authenticated :user do
    root :to => 'photos#index'
  end
  root :to => "photos#index"
  devise_for :users
  resources :users
end