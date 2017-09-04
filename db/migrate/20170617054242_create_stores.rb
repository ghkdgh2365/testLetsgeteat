class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :store_name
      t.string :tel_number
      t.string :keyword, array: true, default: []
      t.string :closed_holiday
      t.string :food_category
      t.string :distance, array: true, default: []
      t.string :breaktime
      t.string :opentime
      t.string :address
 
 
      t.timestamps null: false
    end
  end
end
