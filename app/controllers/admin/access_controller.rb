class Admin::AccessController < ApplicationController
  
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end

  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_admin = Admin.where(username: params[:username]).first
      if found_admin
        authorized_admin = found_admin.authenticate(params[:password])
      end
    end

    if authorized_admin
      session[:admin_id] = authorized_admin.id
      flash[:notice] = "You are now logged in."
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
  	session[:admin_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(admin_access_login_path)
  end

end
