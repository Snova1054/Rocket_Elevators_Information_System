class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :building_type
      t.integer :appartement
      t.integer :floor
      t.integer :basement
      t.string :plan
      t.integer :business
      t.integer :parking
      t.integer :cages
      t.integer :occupant
      t.integer :elevatorNeeded
      t.integer :price
      t.integer :fees
      t.integer :totalPrice
      

      t.timestamps
    end
  end
end