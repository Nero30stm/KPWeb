class CreateRestreviews < ActiveRecord::Migration[5.2]
  def change
    create_table :restreviews do |t|
      t.string :name, null:false 
      t.text :descr, null:false 
      t.integer :rate, null:false 
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
