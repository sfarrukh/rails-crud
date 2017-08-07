class RentalsController < ApplicationController

	def new
		if session[:customer_id]
			@customer = Customer.find(session[:customer_id])

			@pending_process = RentalPending.new()


			# @rental = Rental.new
			if session[:pending_rent]
				@hash = Hash.new(0)
				session[:pending_rent].each do |film|
					@hash[Film.find(film)] += 1
				end
			else
			end
		else
			redirect_to(account_access_login_path)
		end
	end

	def create
		@rental = Rental.new(rental_parameters)
		if @rental.save
			# redirect_to(ordered_checkout)
			flash[:notice] = "Your order has been successfully submitted"
		else
		end
	end

	private
		def rental_parameters
			params.require(:rental).permit(:rental_date, :inventory_id, :customer_id, :staff_id)
		end

end