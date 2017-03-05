class CartController < ApplicationController

	def show
		@customer = session[:customer_id]	
		@item = Film.find(params[:id])
	end
end
