class RentalPendingsController < ApplicationController

	def create
		customer = session[:customer_id]
		films = session[:pending_rent]
		films.each do |film|
			RentalPending.create(:customer_id => customer, :film_id => film)
		end
		session[:pending_rent] = nil
		redirect_to(root_path)
		flash[:notice] = "Your order has been placed"
	end
end
