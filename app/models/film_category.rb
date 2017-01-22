class FilmCategory < ApplicationRecord
	self.table_name = "film_category"

	belongs_to :film
	belongs_to :category
end
