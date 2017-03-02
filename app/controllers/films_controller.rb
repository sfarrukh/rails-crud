class FilmsController < ApplicationController
	
	before_action :customer_logged_in

	def index
		@customer = Customer.find(session[:customer_id])
		@rented_films = @customer.film.sorted
	end

	def show
		
	end
end
