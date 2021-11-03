class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string  :company_name
      t.string :compagny_headquarters_adress
      t.string :full_name_of_the_compagny_contact 
      t.string :compagny_contact_phone
      t.string  :email_of_the_compagny_contact
      t.text :compagny_description 
      t.string  :full_name_of_service_technical_authority
      t.integer :technical_authority_phone_for_service
      t.string :technical_manager_email_for_service 

      t.timestamps
    end
  end
end
