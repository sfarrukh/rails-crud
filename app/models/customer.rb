class Customer < ApplicationRecord
	self.table_name = "customer"

	has_secure_password

	# has_one :address, :class_name => "Address", :foreign_key => "address_id"
	# accepts_nested_attributes_for :address
	belongs_to :address

	has_many :rental #2
	has_many :inventory, :through => :rental #4
	has_many :films, :through => :inventory #5 

	has_one :customer_payment_info
	has_many :rental_pendings, :foreign_key => :customer_id

	# has_one :city, :through => 'address'
	# has_one :country, :through => 'city'

	def full_name
		"#{first_name} #{last_name}"
	end


	scope :sorted, lambda { order("first_name ASC")}
	scope :search, lambda {|customer_search| where(["first_name LIKE ?", "#{customer_search}%"]).or(where(["last_name LIKE ?", "#{customer_search}%"])) }
	scope :letter, lambda {|first_letter| where(["first_name LIKE ?", "#{first_letter}%"])}


end
