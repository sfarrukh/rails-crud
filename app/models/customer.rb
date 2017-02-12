class Customer < ApplicationRecord
	self.table_name = "customer"

	# has_one :address, :class_name => "Address", :foreign_key => "address_id"
	# accepts_nested_attributes_for :address
	belongs_to :address

	# has_one :city, :through => 'address'
	# has_one :country, :through => 'city'

	def full_name
		"#{first_name} #{last_name}"
	end


	scope :sorted, lambda { order("first_name ASC")}
	scope :search, lambda {|customer_search| where(["first_name LIKE ?", "#{customer_search}%"]).or(where(["last_name LIKE ?", "#{customer_search}%"])) }

	# def self.search(query)
	# 	if query
	# 		where('first_name LIKE ?', "%#{query}%")
	# 	else
	# 		all
	# 	end
	# end


end
