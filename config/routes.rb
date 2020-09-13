Rails.application.routes.draw do
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  resources :homes, only: [:about]
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end
