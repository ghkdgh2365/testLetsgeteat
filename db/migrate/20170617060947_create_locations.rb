class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      
      t.integer :store_id
      t.string :ltd
      t.string :lng

      t.timestamps null: false
    end
  end
end
