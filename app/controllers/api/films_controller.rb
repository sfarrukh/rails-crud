class Api::FilmsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def actors
		film = Film.find(params[:film_id])
		actors = film.actors
		if actors
			render json: actors
		else
			render json: 404
		end
	end

	def index
		films = Film.sorted
		# films = Film.search(params[:film_search]).sorted
		render json: films
		# films = Film.search(params[:film_search]).sorted
	end

	def search
		films = Film.search(params[:film_search]).sorted
		render json: films
	end

	def show
		film = Film.find(params[:id])

		if film
			render json: film
		else
			render json: 404
		end
	end

	def new
		film = Film.new
		render json: film
	end

	def create
		film = Film.new(film_params)
		if film.save 
			render json: { message: "Success" }
		else
			render json: { message: "Failure" }
		end
	end


	private
	    def film_params
	      params.require(:film).permit(:title, :language_id, :rental_duration, :rental_rate, :replacement_cost, :release_year, :description, :rating, :special_features)
	    end


end