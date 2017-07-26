class Address < ApplicationRecord
	self.table_name = "address"

	has_one :customer
	accepts_nested_attributes_for :customer

	belongs_to :city

	scope :sorted, lambda { order("address ASC")}


	validates :address, presence: true, length: { maximum: 50 }
	validates :district, :phone, presence: true, length: { maximum: 20 }
	validates :city_id, presence: true, length: { maximum: 5 }

end
