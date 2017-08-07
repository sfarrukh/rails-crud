class Inventory < ApplicationRecord
	self.table_name = "inventory"

	has_many :rental #1
	belongs_to :film #3
	belongs_to :customer #4
	belongs_to :rental_pending
end
