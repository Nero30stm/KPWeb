class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name, null:false
      t.text :descr
      t.string :job, null:false
      t.string :photo, null:false
      t.timestamps
    end
  end
end
