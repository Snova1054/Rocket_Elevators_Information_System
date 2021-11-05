class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
       #link battery id to column
       t.string :entity_type #(Residential,Commercial,Corporate) | ask for hybrid
       t.integer :number_of_floors_served
       t.string :status
       t.text :information
       t.text :notes
       

      t.timestamps
    end
  end
end
