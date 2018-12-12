class PlayersController < ApplicationController

  def index
    all_players = Player.all
    all_players.each do |player|
      player.fixture_list = ""
        Opposition.where(player_id: player.id)[0..4].order('gameweek ASC')
.each do |opposition|
        player.fixture_list << (opposition.opp_short_name_string) << " "
      end
    end
    render json: all_players
  end

  def create
  end

end
