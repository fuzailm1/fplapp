class DropOppositionTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :oppositions
  end
end
