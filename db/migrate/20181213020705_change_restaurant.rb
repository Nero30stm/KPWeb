class ChangeRestaurant < ActiveRecord::Migration[5.2]
  def change
  	add_column :restaurants, :latitude, :decimal
  	add_column :restaurants, :longitude, :decimal
  end
end
