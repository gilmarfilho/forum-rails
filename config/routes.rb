Rails.application.routes.draw do
  root 'posts#index'
  resources :comments, only: [:create, :destroy, :update]
  resources :posts
  put '/posts/:id/like', to: 'posts#like'
  put '/posts/:id/dislike', to: 'posts#dislike'
  devise_for :users
end
