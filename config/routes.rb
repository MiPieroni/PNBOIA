Rails.application.routes.draw do
  # get '/messages/new', to: 'messages#new'
  # post '/messages', to: 'messages#create'
  get 'pharmacies/index'

  get 'medications/index'
  devise_for :users
  root to: 'pages#home'

  resources :medication_orders, only: %i[new create show index]
  resources :donations, only: %i[new create index show]
  resources :pharmacies, only: :index
  resources :medications, only: :index

  get 'programation', to: 'pages#programation'
  get 'medications/reservation', to: 'medications#reservation'
  get 'pages/about', to: 'pages#about', as: "about"

  controller :pages do
    get :qr_code_generator
    get :qr_code_download
  end

end
