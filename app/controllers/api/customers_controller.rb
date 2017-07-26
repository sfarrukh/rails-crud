class Api::CustomersController < ApplicationController

	def index
		customers = Customer.sorted
		render json: customers
	end

	def show
		customer = Customer.find(params[:id])
		render json: customer
	end

	def new
		customer = Customer.new
		render json: customer
	end


end