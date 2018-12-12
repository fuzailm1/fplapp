class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players, id: false do |t|
      t.integer :id,  primary_key: true, null: false
      t.string :name
      t.integer :team_id
      t.float :cost
      t.float :selected_by
      t.integer :transfers_out_this_gw
      t.integer :transfers_in_this_gw
      t.integer :points
      t.float :ppg
      t.integer :goals
      t.integer :assists
      t.integer :clean_sheets
      t.float :xg
      t.float :xa
      t.integer :bps
      t.string :fixture_list

      t.timestamps
    end
  end
end
