class AddPriceFeelToStores < ActiveRecord::Migration
  def change
    add_column :stores, :price_feel, :integer
  end
end
