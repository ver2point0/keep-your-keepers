Rails.application.routes.draw do
  
  devise_for :users
  
  resources :users do 
    resources :keeps, except: :index
  end
  root "welcome#index"

end
