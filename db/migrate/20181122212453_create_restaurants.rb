class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null:false
      t.text :descr, null:false
      t.string :mainPhoto, null:false
      t.string :addr, null:false
      t.float :rate, null:false
      t.timestamps
    end
  end
end
