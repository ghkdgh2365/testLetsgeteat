class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      
      t.integer :store_id
      t.string :menu_name
      t.integer :price
      t.string :menu_category

      t.timestamps null: false
    end
  end
end
