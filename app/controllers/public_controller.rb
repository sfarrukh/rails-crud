class PublicController < ApplicationController
  
  def index
  	if session[:customer_id]
    	@found_customer = Customer.find(session[:customer_id])
    	@customer = @found_customer.first_name
    end	
    
    if session[:pending_rent]
    	@cart_count = session[:pending_rent].count
    end
  end

  def search
    @films = Film.search(params[:film_search]).sorted
    if @films.blank?
      flash[:notice] = "No match found"
    else
      flash[:notice] = nil
    end
  end

  def letter
    @films = Film.letter(params[:first_letter])
    if @films.blank?
      flash[:notice] = "No match for this letter"
    else
      flash[:notice] = nil
    end    
  end  


end
