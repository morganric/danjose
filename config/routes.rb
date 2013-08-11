Danjose::Application.routes.draw do
  resources :guesses
  resources :songs
  resources :posts

  match "/home/goodbye" => "home#goodbye"

  authenticated :user do
    root :to => 'posts#index'
  end
  root :to => "posts#index"
  devise_for :users
  resources :users
end