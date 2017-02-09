class Staff::FilmsController < ApplicationController

	def index
		@films = Film.sorted
	end

	def show
		@film = Film.find(params[:id])
		@film_actors = @film.actors

	end

end