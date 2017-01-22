class Address < ApplicationRecord
	self.table_name = "address"

	has_one :customer
	accepts_nested_attributes_for :customer

	belongs_to :city
end
