class PublicController < ApplicationController
  
  def index
  	@films = Film.search(params[:film_search]).sorted
  end


end
