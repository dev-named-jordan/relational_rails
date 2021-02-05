Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  get '/schools/:id', to: 'schools#show'

  get '/students', to: 'students#index'

  get '/hockeyteams', to: 'hockey_teams#index'
  get '/hockeyteams/new', to: 'hockey_teams#new'
  post '/hockeyteams', to: 'hockey_teams#create'
  get '/hockeyteams/:id', to: 'hockey_teams#show'
end
