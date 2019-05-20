Rails.application.routes.draw do

  resources :users, only: [:index, :show, :create]
  resources :chatrooms, only: [:index, :show, :create, :destroy]
  resources :messages, only: [:index, :show, :create, :destroy]
  
end
