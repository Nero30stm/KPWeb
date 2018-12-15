class DropRestaurantsDishes < ActiveRecord::Migration[5.2]
  def change
  	drop_table :restaurants_dishes
  end
end
