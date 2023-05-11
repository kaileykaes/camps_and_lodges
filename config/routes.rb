Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ('/')
  # root 'articles#index'
  get '/camps', to: 'camps#index'
  get '/camps/:id', to: 'camps#show'
  get '/camps/:id/lodges', to: 'camps#show_lodges'
  get '/lodges', to: 'lodges#index'
  get '/lodges/:id', to: 'lodges#show'
end
