class CartController < ApplicationController

	def show
		if @id = params[:id].to_i
			@film_inventory = Inventory.where(["film_id = ?", @id])
			
			if @film_inventory && session[:pending_rent]
				if @film_inventory.count > session[:pending_rent].count(@id)
					@film = Film.find(params[:id])
					(session[:pending_rent] ||= []) && (session[:pending_rent] << @film.film_id) 
					flash[:notice] = @film.title + " added to cart"
					redirect_to(root_path)
				else
					@film = Film.find(params[:id])
					flash[:notice] = @film.title + " is out of stock"
					redirect_to(root_path)
				end					
			else
				@film = Film.find(params[:id])
				(session[:pending_rent] ||= []) && (session[:pending_rent] << @film.film_id) 
				flash[:notice] = @film.title + " added to cart"
				redirect_to(root_path)				
			end
		end
	end

	def index
		if session[:pending_rent]
			@hash = Hash.new(0)
			session[:pending_rent].each do |film| 
				@hash[Film.find(film)] += 1
			end
		else
			flash[:notice] = "Your cart is empty"
			redirect_to(root_path)
		end
	end

	def add
		@id = params[:id].to_i
		@film_available = Inventory.where(["film_id = ?", @id])
		if @film_available.count > session[:pending_rent].count(@id)
			session[:pending_rent] << params[:id].to_i
			redirect_to(cart_index_path)
		else
			flash[:notice] = Film.find(@id).title + " is out of stock"
			redirect_to(cart_index_path)
		end
	end

	def subtract
		if params[:id]
			@films = session[:pending_rent]
			@films.delete_at(@films.index(params[:id].to_i))
			redirect_to(cart_index_path)
		end
	end

	def delete
		if @id = Film.find(params[:id]).film_id
			session[:pending_rent].delete(@id)
			redirect_to(cart_index_path)
		end
	end
	
end
