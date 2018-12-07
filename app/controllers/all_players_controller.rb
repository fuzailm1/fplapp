class AllPlayersController < ApplicationController
    before_action :get_all_players

    def get_data
      all_players = Array.new
      @all_data["elements"].each do |player|
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
        # get_fixtures player["id"]
        # fixtures = []
        # @player_data["fixtures"].each do |fixture|
        #   fixtures.push(
        #     gameweek: fixture["event"],
        #     opponent_name: fixture["opponent_name"],
        #     opponent_short_name: fixture["opponent_short_name"],
        #     is_home: fixture["is_home"],
        #     difficulty: fixture["difficulty"]
        #   )
        # end
      end
      render json: all_players.to_json
    end

    def home
    end

    def get_fixtures
      player_id = params[:id]
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/element-summary/#{player_id}"
      puts url
      buffer = open(url).read
      @player_data = JSON.parse(buffer)
      render json: @player_data["fixtures"].to_json
    end

end
