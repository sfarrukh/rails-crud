class RentalPending < ApplicationRecord
	has_many :inventory, :through => :film
	belongs_to :customer
	belongs_to :film
end
