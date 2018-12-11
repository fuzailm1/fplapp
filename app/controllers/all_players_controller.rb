class AllPlayersController < ApplicationController
    before_action :get_all_players, only: %i[get_player_data]

    def get_player_data
      @player_data.each do |player|
        player_data = Player.new
        player_data.id = player["id"]
        player_data.name = "#{player["first_name"]} #{player["second_name"]}"
        player_data.cost = player["now_cost"]/10.0
        player_data.selected_by = player["selected_by_percent"]
        player_data.transfers_out_this_gw = player["transfers_out_event"]
        player_data.transfers_in_this_gw = player["transfers_in_event"]
        player_data.total_points = player["total_points"]
        player_data.ppg = player["points_per_game"]
        player_data.goals = player["goals_scored"]
        player_data.assists = player["assists"]
        player_data.clean_sheets = player["clean_sheets"]
        player_data.save! unless Player.find_by(id: player_data.id)
      end
    end

    def get_fixture_data
      Player.all.each do |player|
      get_fixtures player.id
      fixtures = Array.new
      @fixture_data["fixtures"].each do |fixture|
          fixture_data = Fixture.new
          fixture_data.id = fixture["id"]
          fixture_data.gameweek = fixture["event"]
          fixture_data.opp_name = fixture["opponent_name"]
          fixture_data.opp_short_name = fixture["opponent_short_name"]
          fixture_data.is_home = true if (fixture["is_home"] == true)
          fixture_data.difficulty = fixture["difficulty"]
          fixture_data.save! unless Fixture.find_by(id: fixture_data.id)
          fixtures.push(fixture_data)
        end
      end
    end

    def update_fixtures
      Player.all.each do |player|
        get_fixtures player.id
        fixtures = Array.new
        @fixture_data["fixtures"].each do |fixture|
          fixtures.push(Fixture.find_by(id: fixture["id"]))
        end
        player.fixtures = fixtures
      end
      render json: Player.all.to_json
    end

    def home
    end

    def get_all_players
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/elements"
      buffer = open(url).read
      @player_data = JSON.parse(buffer)
    end

    def get_fixtures player_id
      puts player_id
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/element-summary/#{player_id}"
      puts url
      buffer = open(url).read
      @fixture_data = JSON.parse(buffer)
    end

end
