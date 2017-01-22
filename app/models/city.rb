class City < ApplicationRecord
	self.table_name = "city"

	has_many :address#, :class_name => "Address", :foreign_key => "city_id"
	accepts_nested_attributes_for :address

	belongs_to :country
end
