Rails.application.routes.draw do
    get 'home/index'

    get '/login' => 'auth#new'
    post '/login' => 'auth#create'
    get '/logout' => 'auth#destroy'

    resources :dashboards, only:[:index]

    root 'home#index'
end
