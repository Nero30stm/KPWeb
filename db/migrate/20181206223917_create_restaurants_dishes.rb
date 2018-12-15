class CreateRestaurantsDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants_dishes do |t|
    	t.references :dish
    	t.references :restaurant
    end
  end
end
