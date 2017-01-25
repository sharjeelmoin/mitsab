Rails.application.routes.draw do

  get 'lots/show'

  namespace :admin do
    get '/' => "lots#index"
    resources :lots
    get 'dashboard/upload' => "dashboard#upload_csv"
  end
  get 'pages/home'
  get 'pages/csv'
  get 'pages/smarter'
  get 'search'   => 'search#index'
  get  'about'   => "pages#about"
  get  'whyMitsab'   => "pages#whyMitsab"
  get  'contact' => "pages#contact"
  get  'error' => "pages#error"
  
  devise_for :users

  resources :lots do
  	resources :bids
  end
  root "pages#home"

  mount Resque::Server.new, :at => "/resque"
end
