Rails.application.routes.draw do

  get 'users/show'

  devise_for :users
  resources :users, only: [:show]
  
  resources :users do 
    resources :keeps, except: :index
  end
  
  # shallow resourcing for keeps and keepers
  resources :keeps, except: :index do 
    resources :keepers, except: :index
  end 
  
  # shallow resourcing for keepers and likes
  resources :keepers, except: :index do
    resources :likes, only: [:create, :destroy]
  end
  
  root "welcome#index"
  
  post :incoming, to: "incoming#create"

end
