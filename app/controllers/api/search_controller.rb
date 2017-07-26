class Api::SearchController < ApplicationController

	def films
		films = Film.search(params[:film_search]).sorted
		render json: films
	end

	def actors
		actors = Actor.search(params[:actor_search]).sorted
		render json: actors
	end
end