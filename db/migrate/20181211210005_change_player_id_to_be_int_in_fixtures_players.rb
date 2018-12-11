class ChangePlayerIdToBeIntInFixturesPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :fixtures_players, :player_id, :int
    change_column :fixtures_players, :fixture_id, :int
  end
end
