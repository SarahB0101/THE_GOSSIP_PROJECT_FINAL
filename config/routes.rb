Rails.application.routes.draw do
 	
  root 'index#show'
  resources :cities
  # get 'gossips/new', to: 'gossips#new' #on affiche le formulaire
  # post 'gossips', to: 'gossips#create' #puis on l'envoie
  resources :gossips
  resources :users
  
  resources :gossips do
  resources :users
  end

  resources :comments

  resources :gossips do
  resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :tags, only: [:create]
  
  #get 'users/:id', to:'user#show', as: 'users'
  #get 'gossips/:id', to:'gossip#show', as: 'gossips'
  get 'welcome/:user_entry', to: 'welcome#show'
  get '/index', to: 'index#show'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show' 
end
  

