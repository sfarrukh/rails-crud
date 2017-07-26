class Account::AccessController < ApplicationController

  before_action :customer_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
    @found_customer = Customer.find(session[:customer_id])
    @customer = @found_customer.first_name
    @customer_id = @found_customer.customer_id

    if session[:pending_rent]
      @cart_count = session[:pending_rent].count
    end
  end

  def login
  end
  
  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_customer = Customer.where(username: params[:username]).first
      if found_customer
        customer = found_customer.authenticate(params[:password])
      end
    end

    if customer
      session[:customer_id] = customer.id
      flash[:notice] = "You are now logged in."
      redirect_to(account_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
  	session[:customer_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(account_access_login_path)
  end  

  private
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :store_id, :address_id)
    end

end