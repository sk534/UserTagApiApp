Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      
      resources :sessions, only: [:create,:destroy]
      devise_scope :user do 
        post '/login' => 'sessions#create'
        delete '/logout' => 'sessions#destroy'
      end
      # get '/user_list' => 'users#index' 
      # get '/show_user' => 'users#show'
      get '/users' => 'users#index' 
      post '/create_user' => 'users#create_user'
      post '/update_user' => 'users#update'
      post '/deactivate_user' => 'users#deactivate_user'
      post '/delete_user' => 'users#delete_user'

      get '/tags' => 'tags#index' 
      post '/create_tag' => 'tags#create_tag'
      post '/update_tag' => 'tags#update_tag'
      post '/delete_tag' => 'tags#delete_tag'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
