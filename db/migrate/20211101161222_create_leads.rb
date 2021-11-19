class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :full_name
      t.string :company_name
      t.string :email
      t.string :phone_number
      t.string :project_name
      t.string  :project_description
      t.string  :departement_in_charge_of_the_elevators
      t.text  :message
      t.string :filename
      t.string :content_type
      t.binary :file_contents, :limit => 10.megabyte
      

      t.timestamps
    end
  end
end
