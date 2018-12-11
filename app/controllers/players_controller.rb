class PlayersController < ApplicationController

  def index
    all_players = Player.all
    render json: all_players.to_json
  end

  def create
  end

end
