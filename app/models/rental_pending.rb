class RentalPending < ApplicationRecord
	has_one :inventory
	has_many :customer
end
