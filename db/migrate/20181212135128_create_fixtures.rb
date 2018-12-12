class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures, id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.integer :home_team
      t.integer :away_team
      t.integer :gameweek

      t.timestamps
    end
  end
end
