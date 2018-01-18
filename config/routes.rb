Rails.application.routes.draw do
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    resources :home, only: [:index], path: ''
    resources :dashboards, only: [:index], as: 'dashboard'

    resources :users

    root 'dashboards#index'
end
