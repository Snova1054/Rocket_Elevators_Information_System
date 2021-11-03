class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details do |t|
      #BuildingId: To link this information to the building
      
#     #Information key (type, contruction_year, etc.)
#     information_key(informations_type string, contruction_year string)
#     # # #Value (commercial, 1983, etc.)
#     # information_value(commercial string,"ex:1983" string) # hashes http://ruby-for-beginners.rubymonstas.org/built_in_classes/hashes.html


#     #attributes = person.person_attributes.each_with_object({}) do |attribute, hash|hash[attribute.key] = attribute.value

#       attributes = building.buildingdetails_attributes.each_with_object({}) do |details, hash|hash[attribute.key] = attribute.value

      #   Information key (type, contruction_year, etc.)
      t.string :informations_key
       #   Value (commercial, 1983, etc.)
      t.string :value
      

#      t.integer :number_of_floors
#      t.string :type 
#      t.string :architecture
#      t.string :contruction_year
#      t.integer  :maximum_number_of_occupants
      
       t.timestamps
  end
 end
end
