class Staff::ActorsController < ApplicationController

	before_action :staff_logged_in

	def index
		@actors = Actor.sorted
	end

	def show
		@actor = Actor.find(params[:id])
		@actor_films = @actor.films
	end

end