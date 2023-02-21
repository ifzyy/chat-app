Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "chatroom#index"

  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
    delete 'logout', to: 'session#destroy'
  get '/signup', to: 'registration#new'
end
