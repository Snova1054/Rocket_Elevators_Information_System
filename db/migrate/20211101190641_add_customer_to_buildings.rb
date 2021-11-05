class AddCustomerToBuildings < ActiveRecord::Migration[5.2]
  def change
    add_reference :buildings, :customer, foreign_key: true
  end
end
