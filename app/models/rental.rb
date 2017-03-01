class Rental < ApplicationRecord
	self.table_name = "rental"

	belongs_to :inventory #1
	belongs_to :customer #2
end
