class AllPlayersController < ApplicationController
    before_action :get_player_data, only: %i[update_player_data update_web_name]
    before_action :get_fixture_data, only: :update_fixture_data
    before_action :get_team_data, only: :update_team_data
    before_action :get_understat_data, only: :update_understat_data



    def update_player_data
      @player_data.each do |player|
        player_data = Player.new
        player_data.id = player["id"]
        player_data.name = "#{player["first_name"]} #{player["second_name"]}"
        player_data.team_id = player["team"]
        player_data.cost = player["now_cost"]/10.0
        player_data.selected_by = player["selected_by_percent"]
        player_data.transfers_out_this_gw = player["transfers_out_event"]
        player_data.transfers_in_this_gw = player["transfers_in_event"]
        player_data.points = player["total_points"]
        player_data.ppg = player["points_per_game"]
        player_data.goals = player["goals_scored"]
        player_data.assists = player["assists"]
        player_data.clean_sheets = player["clean_sheets"]
        player_data.web_name = player["web_name"]
        player_data.save! unless Player.find_by(id: player_data.id)
      end
    end

    def update_web_name
      @player_data.each do |player|
        player_data = Player.find_by(id: player["id"])
        player_data.update(web_name: player["web_name"])
      end
    end

    def update_fixture_data
      @fixture_data.each do |fixture|
        fixture_data = Fixture.new
        fixture_data.id = fixture["id"]
        fixture_data.home_team = fixture["team_h"]
        fixture_data.away_team = fixture["team_a"]
        fixture_data.gameweek = fixture["event"]
        fixture_data.save! unless Fixture.find_by(id: fixture_data.id)
      end
    end

    def update_team_data
      @team_data.each do |team|
        team_data = Team.new
        team_data.id = team["id"]
        team_data.name = team["name"]
        team_data.short_name = team["short_name"]
        team_data.save! unless Team.find_by(id: team_data.id)
      end
    end

    def update_understat_data
      @understat_data.each do |understat_player|
        player_data = Player.where('name LIKE ?', understat_player["player_name"]).or(Player.where('web_name LIKE ?', understat_player["player_name"])).first
        player_data.update!({xg: understat_player["xG"], xa: understat_player["xA"]}) unless player_data.nil?
      end
    end

    def get_team_data
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/teams"
      puts url
      buffer = open(url).read
      @team_data = JSON.parse(buffer)
    end

    def get_fixture_data
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/fixtures"
      puts url
      buffer = open(url).read
      @fixture_data = JSON.parse(buffer)
    end


    def update_opposition_data
      Player.all.each do |player|
        get_opposition_data player.id
        @opposition_data["fixtures"].each do |opposition|
          opposition_data = Opposition.new
          opposition_data.fixture_id = opposition["id"]
          if(player.id == opposition["team_a"])
            opposition_data.team_id = opposition["team_h"]
          else opposition_data.team_id = opposition["team_a"]
          end
          opposition_data.gameweek = opposition["event"]
          opposition_data.opp_name = opposition["opponent_name"]
          opposition_data.opp_short_name_string = opposition["opponent_short_name"]
          opposition_data.player_id = player.id
          opposition_data.save! unless Opposition.find_by(player_id: player.id, fixture_id: opposition_data.fixture_id)
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

    def get_player_data
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/elements"
      buffer = open(url).read
      @player_data = JSON.parse(buffer)
    end

    def get_opposition_data player_id
      puts player_id
      require 'open-uri'
      require 'json'
      require 'pp'
      url = "https://fantasy.premierleague.com/drf/element-summary/#{player_id}"
      puts url
      buffer = open(url).read
      @opposition_data = JSON.parse(buffer)
    end

    def get_understat_data
      require 'open-uri'
      require 'json'
      require 'pp'
      require 'nokogiri'
      url = "https://understat.com/league/EPL"
      doc = Nokogiri::HTML(open(url))
      block = doc.css('.block-content')
      line = block[2].css('script')
      line = "#{line.pop}"
      jsonstring = "#{line[40..-14]}"
      @understat_data = JSON.parse(eval('"' + jsonstring + '"'))
    end

end
