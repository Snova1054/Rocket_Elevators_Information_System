class Building < ApplicationRecord
    belongs_to :customer
    has_one :building_details
    has_one :address
    has_one :battery
end
