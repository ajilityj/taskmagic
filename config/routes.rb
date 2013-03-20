TaskMagic::Application.routes.draw do

  root to: 'tasks#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :users do
    resources :tasks
  end
  resources :tasks do
    get 'calendar', :on => :collection
  end
  resources :subtasks
  resources :platforms
end
