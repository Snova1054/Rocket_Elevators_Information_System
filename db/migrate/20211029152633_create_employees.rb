class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :last_name,  null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :title,  null: false, default: ""

      t.timestamps
    end
  end
end
