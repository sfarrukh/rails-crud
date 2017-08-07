class Staff::OrdersController < ApplicationController

	def index
		@pending_orders = RentalPending.where(shipped: false)
	end




end