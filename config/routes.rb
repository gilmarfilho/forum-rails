Rails.application.routes.draw do
  root 'posts#index'
  resources :comments, only: [:create, :destroy, :update]
  resources :posts
  devise_for :users
end
