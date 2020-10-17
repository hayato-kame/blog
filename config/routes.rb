Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resource :account, only: [:show, :edit, :update]
  
  get 'signup', to: 'users#new'
  
  resources :users
  
end
