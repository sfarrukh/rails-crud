class CartController < ApplicationController

	def show
		if session[:customer_id]
			@customer = Customer.find(session[:customer_id])
		end

		@item = Film.find(params[:id])
	end

	
end
