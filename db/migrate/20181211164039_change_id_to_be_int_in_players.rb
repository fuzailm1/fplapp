class ChangeIdToBeIntInPlayers < ActiveRecord::Migration[5.2]
  def change
    change_column :players, :id, :int
  end
end
