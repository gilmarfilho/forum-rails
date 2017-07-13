Rails.application.routes.draw do
  root 'posts#index'
  get '/posts/hashtag/:name', to:'posts#hashtags'
  resources :comments, only: [:create, :destroy, :update]
  resources :reports, only: [:index, :destroy]
  devise_for :users
  resources :posts do
    member do
        put "like", to: 'posts#like'
        put "dislike", to: 'posts#dislike'
        put "unlike", to: 'posts#unlike'
        put "undislike", to: 'posts#undislike'
        get "report", to: 'reports#create'
    end
  end
end
