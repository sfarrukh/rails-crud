class Actor < ApplicationRecord
	self.table_name = "actor"

	has_many :film_actor
	has_many :films, :through => :film_actor
	
	accepts_nested_attributes_for :films

	scope :sorted, lambda { order("first_name ASC")}
	scope :search, lambda {|actor_search| where(["first_name LIKE ?", "#{actor_search}%"]).or(where(["last_name LIKE ?", "#{actor_search}%"])) }
	scope :letter, lambda {|first_letter| where(["first_name LIKE ?", "#{first_letter}%"])}

	def full_name
		"#{first_name} #{last_name}"
	end

	validates :first_name, :last_name, 
		presence: true, 
		format: { with: /\A[a-zA-Z ]+\z/, message: "only allows letters" }, 
		length: { maximum: 45 }

end
