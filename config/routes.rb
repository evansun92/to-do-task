Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "tasks#index"

  post 'change_locale', to: 'application#change_locale'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :tasks do
    member do
      patch :take
      patch :drop
    end
    collection do
      get 'search', to: 'tasks#search'
    end
  end

  namespace :admin do
    resources :users
  end
  
end
