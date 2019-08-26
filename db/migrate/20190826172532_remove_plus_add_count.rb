class RemovePlusAddCount < ActiveRecord::Migration[5.2]
  def change
    change_table :guests do |t|
      t.remove :plus
      t.integer :count, null: false, default: 0
    end
  end
end
