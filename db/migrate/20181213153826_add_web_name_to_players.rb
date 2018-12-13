class AddWebNameToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :web_name, :string
  end
end
