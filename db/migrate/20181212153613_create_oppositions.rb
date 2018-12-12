class CreateOppositions < ActiveRecord::Migration[5.2]
  def change
    create_table :oppositions do |t|
      t.integer :fixture_id
      t.integer :team_id
      t.integer :gameweek
      t.string :opp_name
      t.string :opp_short_name_string
      t.belongs_to :player, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
