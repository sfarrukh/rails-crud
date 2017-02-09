class Staff::ActorsController < ApplicationController

	skip_before_action :verify_authenticity_token

	def index
		@actors = Actor.sorted
		# render json: @actors

		@actor = Actor.new
	end

	def show
		actor = Actor.find(params[:id])
		if actor 
			render json: actor
		else
			render json: 404
		end
	end

	def new
		@actor = Actor.new
		# render json: Actor.new
	end

	def edit
		actor = Actor.find(params[:id])
		render json: actor
	end

	def create
		@actor = Actor.new(actor_params)

		respond_to do |f|
			if @actor.save
				f.html { redirect_to [:staff, @actor]}
				# f.js {}
				# f.json { render json: @actor, status: :created, location: @actor}
			else
				f.html { render action: 'new'}
				f.json { render json: @actor.errors, status: :unprocessable_entity}
			end
		end
	end

	# def create
	# 	actor = Actor.new(actor_params)
	# 	if actor.save
	# 		# redirect_to(staff_actors_path)
	# 		head 200
	# 		render json: {
	# 			status: 200,
	# 			message: 'Successfully created actor.',
	# 			actor: actor
	# 		}.to_json
	# 	else
	# 		# render("new")
	# 		head 500
	# 		render json: {
	# 			status: 500,
	# 			errors: actor.errors
	# 		}.to_json
	# 	end
	# end

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