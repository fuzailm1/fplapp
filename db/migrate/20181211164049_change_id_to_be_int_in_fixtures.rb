class ChangeIdToBeIntInFixtures < ActiveRecord::Migration[5.2]
  def change
    change_column :fixtures, :id, :int
  end
end
