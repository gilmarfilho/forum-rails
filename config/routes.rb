Rails.application.routes.draw do
  resources :comments
  root 'posts#index'
  resources :posts
  devise_for :users
end
