class CheckoutController < ApplicationController

	def show
		if session[:customer_id]
			@customer = Customer.find(session[:customer_id])
			@address = @customer.address
			@city = @address.city
			@payment = @customer.customer_payment_info.card_number

			@item = Film.find(params[:id])
			@tax	= @item.rental_rate * 0.1
		else
			redirect_to(account_access_login_path)
		end
	end

	def create
		@film = Film.find(params[:id])
		@customer = Customer.find(session[:customer_id])
	end

end