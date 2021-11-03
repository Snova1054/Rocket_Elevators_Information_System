class Customer < ApplicationRecord
    belongs_to :user
    has_many :building
    has_one :address
end
