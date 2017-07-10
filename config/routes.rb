Rails.application.routes.draw do
  root 'posts#index'
  resources :comments, only: [:create, :destroy, :update]
  devise_for :users
  resources :posts do
    member do
        put "like", to: 'posts#like'
        put "dislike", to: 'posts#dislike'
    end
  end
end
