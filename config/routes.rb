Rails.application.routes.draw do
  
  resources :keeps

  devise_for :users
  root "welcome#index"

end
