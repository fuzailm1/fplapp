Rails.application.routes.draw do

  root 'all_players#home'
  get 'all_players/update_player_data'
  get 'all_players/update_team_data'
  get 'all_players/update_fixture_data'
  get 'all_players/update_opposition_data'
  get 'all_players/update_understat_data'
  get 'all_players/update_web_name'

  get 'all_players/json_test'

  get 'all_players/home' => 'all_players#home'

  resources :players, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
