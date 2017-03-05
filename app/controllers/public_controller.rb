class PublicController < ApplicationController
  
  def index
  	@films = Film.search(params[:film_search]).sorted
  	if session[:customer_id]
    	@found_customer = Customer.find(session[:customer_id])
    	@customer = @found_customer.first_name
    end	
  end


end
