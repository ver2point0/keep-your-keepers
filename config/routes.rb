Rails.application.routes.draw do

  devise_for :users
  
  resources :users do 
    resources :keeps, except: :index
  end
  
  # shallow resourcing for keeps and keepers
  resources :keeps, except: :index do 
    resources :keepers, except: :index
  end 
  
  root "welcome#index"

end
