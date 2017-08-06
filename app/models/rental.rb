class Rental < ApplicationRecord
	self.table_name = "rental"
	:rental_date
	belongs_to :inventory #1
	belongs_to :customer #2
	has_many :film, :through => :inventory
end
