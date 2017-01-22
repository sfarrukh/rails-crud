class Actor < ApplicationRecord
	self.table_name = "actor"

	has_many :film_actor
	has_many :films, :through => :film_actor
	
	accepts_nested_attributes_for :films

	scope :sorted, lambda { order("first_name ASC")}

	def full_name
		"#{first_name} #{last_name}"
	end
end
