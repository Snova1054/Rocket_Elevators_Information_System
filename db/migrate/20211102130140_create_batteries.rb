class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      #link building id to battery
      t.string :type #(Residential,Commercial,Corporate) | ask for hybrid
      t.string :status
      #link a employee id to battery
      t.date :date_of_commissioning
      t.date :date_of_last_inspection
      t.string :certificate_of_operations
      t.text :information
      t.text :notes
      

      t.timestamps
    end
  end
end
