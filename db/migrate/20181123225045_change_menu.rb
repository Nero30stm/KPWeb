class ChangeMenu < ActiveRecord::Migration[5.2]
  def change
  	add_reference :dishes, foreign_key: true
  end
end
