Rails.application.routes.draw do


  get 'lots/show'
  get 'pages/home'
  get 'pages/csv'
  get 'pages/smarter'
  get 'search'   => 'search#index'
  get  'about'   => "pages#about"
  get  'faq'   => "pages#faq"
  get  'how_to_buy'   => "pages#how_to_buy"
  get  'why_mitsab'   => "pages#why_mitsab"
  get  'contact' => "pages#contact"
  post  'contact' => "pages#contact_email"
  get  'error' => "pages#error"

  
  devise_for :users

  resources :lots do
  	resources :bids
    resources :watchlists
  end

  resources :watchlists
  get "/my-bids" => "watchlists#bids"
  namespace :admin do
    get '', to: 'dashboard#index', as: '/' 
    get '/auction' => "dashboard#auction"
    resources :lots
    resources :users
    resources :reports
    resources :bulk_upload
    get 'csv/:id' => "bulk_upload#csv"
    get 'dashboard/upload' => "dashboard#upload_csv"
    get 'dashboard/resque' => "dashboard#resque"
    get 'bids/approve/:id' => "bids#approve"
    get 'bids/reject/:id' => "bids#reject"
    mount Resque::Server.new, :at => "/resque"
  end

  root "pages#home"
end
