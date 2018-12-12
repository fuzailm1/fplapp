class PlayersController < ApplicationController
  before_action :get_player_data

  def index
    all_players = Player.all
    all_players.each do |player|
      player.fixture_list = ""
        Opposition.where(player_id: player.id)[0..4].each do |opposition|
        player.fixture_list << (opposition.opp_short_name_string) << " "
      end
    end
    render json: all_players
  end

  def create
  end

end