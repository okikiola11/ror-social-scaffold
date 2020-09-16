Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  post '/friendship/create/:id', to: 'friendships#create'
  post 'users/friendship/create/:id', to: 'friendships#create'
  post 'users/friendship/accept/:id', to: 'friendships#accept'
  post 'users/friendship/reject/:id', to: 'friendships#reject'
  resources :friendships

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
