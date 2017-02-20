class Staff::FilmsController < ApplicationController

	before_action :staff_logged_in

	def index
		@films = Film.sorted
	end

	def show
		@film = Film.find(params[:id])
		@film_actors = @film.actors

	end

end