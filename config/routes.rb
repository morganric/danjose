Danjose::Application.routes.draw do
  resources :guesses
  resources :songs
  resources :posts

  match "/home/goodbye" => "home#goodbye"
  match "/home" => "home#index"

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end