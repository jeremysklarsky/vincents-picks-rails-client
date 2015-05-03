Rails.application.routes.draw do
  #user paths
  resources :users, :except => ['new'] do 
    get 'stats' => 'users#stats'
    resources :reviews, :only => ['new', 'edit', 'create', 'update', 'index'], :controller => "users/reviews" 

    end
  
  get 'signup' => 'users#new', :as => 'signup'
  
  #login routes
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  post 'sessions' => 'sessions#create'

  #resource paths
  resources :movies, only: ['show', 'index']
  resources :critics, only: ['show', 'index']



end
