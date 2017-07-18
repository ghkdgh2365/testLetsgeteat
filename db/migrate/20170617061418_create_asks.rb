class CreateAsks < ActiveRecord::Migration
  def change
    create_table :asks do |t|
      
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :writer_email
      t.string :photo
      t.string :tel_number
      t.string :ask_category
      t.integer :ask_category_cd

      t.timestamps null: false
    end
  end
end
