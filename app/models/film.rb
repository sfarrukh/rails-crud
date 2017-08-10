class Film < ApplicationRecord
	self.table_name = "film"

	has_many :film_actor
	has_many :actors, :through => :film_actor

	accepts_nested_attributes_for :actors

	has_many :film_category
	has_many :category, :through => :film_category

	has_many :inventory #3
	# belongs_to :customer #5
	has_many :rentals, :through => :inventory
	has_many :rental_pendings, :foreign_key => :film_id

	scope :sorted, lambda { order("title ASC")}
	scope :search, lambda {|film_search| where(["title LIKE ?", "#{film_search}%"]).or(where("title LIKE ?", "% #{film_search}%"))}
	scope :letter, lambda {|first_letter| where(["title LIKE ?", "#{first_letter}%"])}

	# def self.search(film_search)
	# 	where("title LIKE ?", "%#{film_search}")
	# 	.or(where("title LIKE ?", "#{film_search}%"))
	# end

	# No NULL columns
	# validates :title, presence: true, length: { maximum: 255 }, format: { with: /\A[a-zA-Z]+\z/ }
	# validates :language_id, :rental_duration, presence: true, length: { maximum: 3 }
	# validates :rental_rate, presence: true, length: { maximum: 6 }
	# validates :replacement_cost, presence: true, length: { maximum: 7 }
	
	# NUllable elements
	# validates :description, format: { with: /\A[a-zA-Z.? ]+\z/ }
	# validates :length, length: { maximum: 5 }
	# validates :rating, format: { with: /'G','PG','PG-13','R','NC-17'/ }
	# validates :special_features, format: { with: /'Trailers','Commentaries','Deleted Scenes','Behind the Scenes'/ }
	
end
