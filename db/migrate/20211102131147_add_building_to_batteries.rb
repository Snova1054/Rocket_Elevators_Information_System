class AddBuildingToBatteries < ActiveRecord::Migration[5.2]
  def change
    add_reference :batteries, :building, foreign_key: true
  end
end
