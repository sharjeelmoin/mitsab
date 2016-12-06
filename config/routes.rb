Rails.application.routes.draw do

  get 'lots/show'

  namespace :admin do
    resources :lots
  end
  get 'pages/home'
  get 'pages/csv'
  get 'search' => 'search#index'
  get  'about' => "pages#about"
  get  'contact' => "pages#contact"
  
  devise_for :users

  resources :lots do
  	resources :bids
  end
  root "pages#home"
end
