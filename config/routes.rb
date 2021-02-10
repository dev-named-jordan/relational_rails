Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  # schools routes
  get '/schools', to: 'schools#index'
  get '/schools/new', to: 'schools#new'
  post '/schools', to: 'schools#create'
  get '/schools/:id', to: 'schools#show'
  get '/schools/:id/edit', to: 'schools#edit'
  patch '/schools/:id', to: 'schools#update'
  delete '/schools/:id', to: 'schools#destroy'
  get '/schools/:id/students', to: 'schools#students'
  get '/schools/:id/students/new', to: 'schools#new_student'
  post '/schools/:id/students', to: 'schools#create_student'

  get '/students', to: 'students#index'
  get '/students/:id', to: 'students#show'
  get '/students/:id/edit', to: 'students#edit'
  patch '/students/:id', to: 'students#update'
  delete '/students/:id', to: 'students#destroy'


  get '/hockeyteams', to: 'hockey_teams#index'
  get '/hockeyteams/new', to: 'hockey_teams#new'
  post '/hockeyteams', to: 'hockey_teams#create'
  get '/hockeyteams/:id', to: 'hockey_teams#show'
  get '/hockeyteams/:id/edit', to: 'hockey_teams#edit'
  patch '/hockeyteams/:id', to: 'hockey_teams#update'
  delete '/hockeyteams/:id', to: 'hockey_teams#destroy'
  get '/hockeyteams/:id/players', to: 'hockey_teams#players'
  get '/hockeyteams/:id/players/new', to: 'hockey_teams#new_player'
  post '/hockeyteams/:id/players', to: 'hockey_teams#create_player'


  get '/players', to: 'players#index'
  get '/players/:id/edit', to: 'players#edit'
  patch '/players/:id', to: 'players#update'
  get '/players/:id', to: 'players#show'
  delete '/players/:id', to: 'players#destroy'

end
