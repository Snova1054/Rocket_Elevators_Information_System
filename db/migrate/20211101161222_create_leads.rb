class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :compagny_name
      t.string :email
      t.string :phone_number
      t.string :project_name
      t.string  :project_description
      t.string  :departement_in_charge_of_the_elevators
      t.text  :message 
      #t.binary  :attached_file # Test afther
      

      t.timestamps
    end
  end
end
