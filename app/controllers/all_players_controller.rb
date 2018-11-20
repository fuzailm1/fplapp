class AllPlayersController < ApplicationController
    before_action :get_all_players

    def get_data
      all_players = Array.new
      @result["elements"].each do |player|
        all_players.push(
          id: player["id"],
          name: "#{player["first_name"]} #{player["second_name"]}",
          now_cost: player["now_cost"]/10.0,
          selected_by_percent: player["selected_by_percent"],
          transfers_out_event: player["transfers_out_event"],
          transfers_in_event: player["transfers_in_event"],
          total_points: player["total_points"],
          points_per_game: player["points_per_game"],
          goals_scored: player["goals_scored"],
          assists: player["assists"],
          clean_sheets: player["clean_sheets"]
        )
      end
      render json: all_players.to_json
    end

    def home
    end
end
