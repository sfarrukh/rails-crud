class Api::SearchController < ApplicationController

	def films
		films = Film.search(params[:film_search]).sorted
		render json: films
	end

	def films_letter
		films = Film.letter(params[:first_letter])
		render json: films
	end

	def actors
		actors = Actor.search(params[:actor_search]).sorted
		render json: actors
	end

	def actors_letter
		actors = Actor.letter(params[:first_letter])
		render json: actors
	end
end