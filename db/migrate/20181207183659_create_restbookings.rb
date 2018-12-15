class CreateRestbookings < ActiveRecord::Migration[5.2]
  def change
    create_table :restbookings do |t|
      t.references :restaurant, index: true, foreign_key: true, null: false
      t.date :requested_datetime, null: false
      t.timestamps
    end
  end
end
