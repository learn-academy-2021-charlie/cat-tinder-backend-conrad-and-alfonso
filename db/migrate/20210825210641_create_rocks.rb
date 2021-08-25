class CreateRocks < ActiveRecord::Migration[6.1]
  def change
    create_table :rocks do |t|
      t.string :name
      t.string :color
      t.integer :brilliance
      t.integer :hardness

      t.timestamps
    end
  end
end
