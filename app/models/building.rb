class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :address
    has_one :building_detail
    has_many :batteries
end
