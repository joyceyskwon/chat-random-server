Rails.application.routes.draw do

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

  resources :users, only: [:index, :show, :create]
  resources :chatrooms, only: [:index, :show, :create, :destroy]
  resources :messages, only: [:index, :show, :create, :destroy]
  
end
