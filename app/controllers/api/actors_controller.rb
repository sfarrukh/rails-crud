class Api::ActorsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def films
		actor = Actor.find(params[:actor_id])
		films = actor.films
		if films
			render json: films
		else
			render json: 404
		end
	end

	def link
		actor = Actor.find(params[:actor_id])
		film = Film.find(params[:film_id])
		if actor.films << film
			render json: actor.films
		else
			render json: 404
		end
	end

	def unlink
		actor = Actor.find(params[:actor_id])
		film = Film.find(params[:film_id])
		if actor.films.delete(film)
			render json: actor.films
		else
			render json: 404
		end
	end

	def index
		actors = Actor.sorted
		render json: actors
	end

	def show
		actor = Actor.find(params[:id])
		if actor 
			render json: actor
		else
			render json: 422
		end
	end

	def new
		render json: Actor.new
	end

	def edit
		actor = Actor.find(params[:id])
		render json: actor
	end

	# def create
	# 	actor = Actor.new(actor_params)

	# 	respond_to do |f|
	# 		if actor.save
	# 			f.html { redirect_to [:api, actor]}
	# 			f.js {}
	# 			f.json { render json: @actor, status: :created, location: @actor}
	# 		else
	# 			f.html { render action: 'new'}
	# 			f.json { render json: actor.errors, status: :unprocessable_entity}
	# 		end
	# 	end
	# end

	def create
		actor = Actor.new(actor_params)
		if actor.save
			render json: { message: 'Success'}
			# # redirect_to(staff_actors_path)
			# render status: 200, json: {
			# 	message: 'Successfully created actor.',
			# 	actor: actor
			# }.to_json
		else
			render json: { message: 'Failure' }
			# render("new")
			# render status: 422, json: {
			# 	errors: actor.errors
			# }.to_json
		end
	end

	def update
		actor = Actor.find(params[:id])
		if actor.update(actor_params)
			render json: {
				status: 200,
				message: "Actor successfully updated",
				actor: actor 
			}.to_json
		else
			render json: {
				status: 500,
				message: "Actor failed to update",
				actor: actor
			}
		end
	end

	def destroy
		actor = Actor.find(params[:id])
		actor.destroy
		render json: {
			status: 200,
			message: "Actor successfully deleted"
		}.to_json
	end

	private
		def actor_params
			params.require(:actor).permit(:first_name, :last_name)
		end

end