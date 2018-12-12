class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams, id: false do |t|
      t.integer :id, primary_key: true, null: false
      t.string :name
      t.string :short_name
      t.integer :position

      t.timestamps
    end
  end
end
