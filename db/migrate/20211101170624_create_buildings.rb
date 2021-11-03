class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string  :full_name_of_the_building_administrator
      t.string  :email_of_the_administrator_of_the_building
      t.string :phone_number_of_the_building_administrator
      t.string  :full_name_of_the_technical_contact_for_the_building
      t.string :technical_contact_email_for_the_building
      t.string :technical_contact_phone_for_the_building 

      t.timestamps
    end
  end
end
