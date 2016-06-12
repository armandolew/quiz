Rails.application.routes.draw do
  resources :questionnaires, only: [:new, :create,:index, :show, :destroy]
  
  get 'games/new/:questionnaire_id/', to: 'games#new', as: 'game_new'
  get 'games/:questionnaire_id/:question_id', to: 'games#show', as: 'game_playing'
  post 'games', to: 'games#create'
  post 'games/get_answer', to: 'games#get_answer', as: 'get_answer'
  get 'games/results', to: 'games#results', as: 'game_results'
  get 'games/welcome', to: 'games#index', as: 'game_welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'games#index'
end
