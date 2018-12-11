Rails.application.routes.draw do

  root 'all_players#home'
  get 'all_players/get_player_data'
  get 'all_players/get_fixture_data'
  get 'all_players/update_fixtures'
  get 'all_players/home' => 'all_players#home'
  get 'all_players/update_fixtures'

  resources :players, only: %i[index create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
