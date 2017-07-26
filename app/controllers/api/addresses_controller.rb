class Api::AddressesController < ApplicationController

	def index
		addresses = Address.sorted
		render json: addresses		
	end

	def show
		address = Address.find(params[:id])
		render json: address
	end

	def new
		address = Address.new
		render json: address
	end

end