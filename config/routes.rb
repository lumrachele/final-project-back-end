Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      resources :users
      resources :games
      resources :user_games
      resources :captions
      resources :game_captions
      mount ActionCable.server =>'/cable'
      get '/start', to: 'game_status#start'
      # post '/start', to: 'game_status#start'


      get '/submissions', to: 'game_status#submissions'
      get '/voting', to: 'game_status#voting'
      get '/results', to: 'game_status#results'
      get '/results/:id', to: 'game_status#resultsWithId'
      get '/anotherGame', to: 'game_status#anotherGame'
    end
  end
end
