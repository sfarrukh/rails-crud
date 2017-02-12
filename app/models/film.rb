class Film < ApplicationRecord
	self.table_name = "film"

	has_many :film_actor
	has_many :actors, :through => :film_actor

	accepts_nested_attributes_for :actors

	has_many :film_category
	has_many :category, :through => :film_category

	scope :sorted, lambda { order("title ASC")}
	scope :search, lambda {|film_search| where(["title LIKE ?", "#{film_search}%"])}
	
end
