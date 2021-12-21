Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/astronauts', to: 'astronauts#index'
  post '/astronaut/:astronaut_id/missions', to: 'astronaut_missions#create'
  resources :astronauts, only: :index
end
