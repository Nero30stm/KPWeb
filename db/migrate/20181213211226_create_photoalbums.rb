class CreatePhotoalbums < ActiveRecord::Migration[5.2]
  def change
    create_table :photoalbums do |t|
      t.string :photo, null:false
      t.text :descr
      t.references :restaurant, foreign_key: true
      t.timestamps
    end
  end
end
