class AddFixtureListToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :fixture_list, :string
  end
end
