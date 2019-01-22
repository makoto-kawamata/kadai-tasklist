Rails.application.routes.draw do

  root to: 'tasks#index'

    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  #get 'users/index'
  #get 'users/show'
  #get 'users/new'
  #get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]

  resources :tasks
  #resources :tasklist, only: [:create, :destroy]

  #root to: 'tasks#index'
  #get 'toppages/index'
  #resources :tasks
end
