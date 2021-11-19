class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :status
      t.string :entity  
      t.string :number_and_street
      t.string :suite_or_apartment
      t.string :city
      t.string  :postal_code
      t.string :country
      t.float :lat
      t.float :lng
      t.text :notes 
  

      t.timestamps
    end
  end
end
