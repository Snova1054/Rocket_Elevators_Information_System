class AddBatteryToColumns < ActiveRecord::Migration[5.2]
  def change
    add_reference :columns, :battery, foreign_key: true
  end
end
