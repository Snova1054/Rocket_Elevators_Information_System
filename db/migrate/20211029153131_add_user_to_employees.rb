class AddUserToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :user, foreign_key: true
  end
end
