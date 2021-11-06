class AddClientToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :client, :boolean, :default => true
  end
end
