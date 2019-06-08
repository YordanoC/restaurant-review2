class AddPriceToRestaurant < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :price_avg, :integer
  end
end
