Rails.application.routes.draw do


    get 'home/index'

    get '/login' => 'auth#new'
    post '/login' => 'auth#create'
    get '/logout' => 'auth#destroy'

    resources :dashboards, only:[:index]
    resources :claims, only: [:index, :show, :edit, :destroy]


    # incoming claims api
    namespace :v1 do
        post '/new_claim' => 'claims#new'
    end

    root 'home#index'
end
