class Staff::AccessController < ApplicationController

	before_action :staff_logged_in, :except => [:login, :attempt_login, :logout]

  def menu
  end

  def login
  end
  
  def attempt_login
  	if params[:username].present? && params[:password].present?
      found_member = Staff.where(username: params[:username]).first
      if found_member
        authorized_member = found_member.authenticate(params[:password])
      end
    end

    if authorized_member
      session[:member_id] = authorized_member.id
      flash[:notice] = "You are now logged in."
      redirect_to(staff_path)
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('login')
    end
  end

  def logout
  	session[:member_id] = nil
    flash[:notice] = "Logged out."
    redirect_to(staff_access_login_path)
  end  
end
