class Country < ApplicationRecord
	self.table_name = "country"

	has_many :city
	accepts_nested_attributes_for :city
end
