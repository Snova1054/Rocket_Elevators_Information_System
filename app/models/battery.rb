class Battery < ApplicationRecord
    belongs_to :building
    has_one :employee
    has_many :columns
end
