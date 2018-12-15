class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :name, null:false
        t.text :descr, null:false
        t.string :mainPhoto, null:false
        t.float :rate, null:false
        t.references :restaurant, foreign_key: true
        t.timestamps
    end
  end
end
