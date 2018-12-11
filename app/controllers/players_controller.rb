class PlayersController < ApplicationController

  def index
    all_players = Player.all
    all_players.each do |player|
      player.fixture_list = ""
      puts player.fixtures.first(5)
      player.fixtures.first(5).each do |fixture|
        player.fixture_list << (fixture.opp_short_name) << " "
      end
    end
    render json: all_players
  end

  def create
  end

end
