Rails.application.routes.draw do
  
  root to: 'toppages#index'
  
  get 'signup', to: 'users#new'
  resources :users do 
    resources :entries, only: [:show]
  end 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
  
  resources :entries, only: [:show, :create, :destroy]
  
end
