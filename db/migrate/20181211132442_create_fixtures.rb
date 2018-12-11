class CreateFixtures < ActiveRecord::Migration[5.2]
  def change
    create_table :fixtures, id: false do |t|
      t.string :id, primary_key: true, null: false
      t.string :gameweek
      t.string :opp_name
      t.string :opp_short_name
      t.boolean :is_home
      t.string :difficulty

      t.timestamps
    end
  end
end
