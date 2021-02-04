Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/schools', to: 'schools#index'
  get '/students', to: 'students#index'
end
