class Admin::AddressesController < ApplicationController

  before_action :confirm_logged_in

  def index
  end
  
  def new
    @address = Address.new
    @customer = @address.build_customer
  end

  def create
    # params = {address: {address:, address2:, district:, city_id:, postal_code:, phone:,
    #           customer_attributes: {first_name:, last_name:, store_id:}}}
    # @address = Address.new(params[:address])
    @address = Address.new(address_params)
    if @address.save
    # if Customer.create(address_params)
      # flash[:notice] = "New Customer '#{@customer.full_name}' created."
      redirect_to(admin_customers_path)
    else
      render('new')
    end  	
  end

  def edit
  	@customer = Customer.find(params[:id])
  	@address = @customer.address
  end

  def delete
  end

  private
    def address_params
      params.require(:address).permit(:address, :address2, :district, :city_id, :postal_code, :phone,
                    customer_attributes: [:first_name, :last_name, :store_id])
      
      # params[:address][:customer] ||= []
      # params.require(:address).permit(:address, :address2, :district, :city_id, :postal_code, :phone, customer: [])
    end
end
