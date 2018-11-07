Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      get '/backgrounds', to: 'background#index'
      post '/users', to: 'user#create'
      get '/gifs', to: 'gif#index'
      post 'sessions', to: 'session#create'
    end
  end

end
