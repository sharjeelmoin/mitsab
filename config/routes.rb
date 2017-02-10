Rails.application.routes.draw do

  get 'lots/show'

  namespace :admin do
    get '/' => "lots#index"
    get '/auction' => "dashboard#auction"
    resources :lots
    get 'dashboard/upload' => "dashboard#upload_csv"
  end
  get 'pages/home'
  get 'pages/csv'
  get 'pages/smarter'
  get 'search'   => 'search#index'
  get  'about'   => "pages#about"
  get  'faq'   => "pages#faq"
  get  'how_to_buy'   => "pages#how_to_buy"
  get  'why_mitsab'   => "pages#why_mitsab"
  get  'contact' => "pages#contact"
  get  'error' => "pages#error"
  
  devise_for :users

  resources :lots do
  	resources :bids
  end
  root "pages#home"

  mount Resque::Server.new, :at => "/resque"
end
