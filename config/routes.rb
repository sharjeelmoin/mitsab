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
  get  'error' => "pages#error"
  
  devise_for :users

  resources :lots do
  	resources :bids
  end

  namespace :admin do
    get '', to: 'lots#index', as: '/' 
    get '/auction' => "dashboard#auction"
    resources :lots
    resources :bulk_upload
    get 'csv/:id' => "bulk_upload#csv"
    get 'dashboard/upload' => "dashboard#upload_csv"
    mount Resque::Server.new, :at => "/resque"
  end

  root "pages#home"
end
