class Category < ApplicationRecord
	self.table_name = "category"

	has_many :film_category
	has_many :film, :through => :film_category

	scope :sorted, lambda { order("name ASC")}
end
