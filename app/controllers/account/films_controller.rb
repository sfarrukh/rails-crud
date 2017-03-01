class Account::FilmsController < ApplicationController

	before_action :customer_logged_in

	def index
    @films = Film.search(params[:film_search]).sorted
  end

end