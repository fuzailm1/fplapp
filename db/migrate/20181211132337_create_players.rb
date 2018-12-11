class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :name
      t.string :cost
      t.string :selected_by
      t.string :transfers_out_this_gw
      t.string :transfers_in_this_gw
      t.string :total_points
      t.string :ppg
      t.string :goals
      t.string :assists
      t.string :clean_sheets
      t.string :xg
      t.string :xa
      t.string :bps

      t.timestamps
    end
  end
end
