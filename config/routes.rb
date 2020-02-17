Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'games/new'
  post 'games/score'
  get '/new', to: 'games#new', as: :about
  get '/score', to: 'games#score', as: :score
end
