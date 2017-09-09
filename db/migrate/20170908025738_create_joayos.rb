class CreateJoayos < ActiveRecord::Migration
  def change
    create_table :joayos do |t|
      t.integer :user_id
      t.integer :store_id
      t.integer :thumb_up

      t.timestamps null: false
    end
  end
end
