class Staff::ActorsController < ApplicationController

	def index
		@actors = Actor.sorted
	end

	def show
		@actor = Actor.find(params[:id])
		@actor_films = @actor.films
	end

end