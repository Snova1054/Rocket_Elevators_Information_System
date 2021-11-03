class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      # link column id to elevator
      t.integer :serial_number 
      t.string :model #(standard,Premium,Excelium)
      t.string :type #(Residential,Commercial,Corporate) | ask for hybrid
      t.string :status
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.string :certificate_of_inspection #check with david
      t.text :information
      t.text :Notes      
      

      t.timestamps
    end
  end
end
