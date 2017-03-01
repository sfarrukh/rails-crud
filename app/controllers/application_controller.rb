class ApplicationController < ActionController::Base
	
  protect_from_forgery with: :exception

  private
		def confirm_logged_in
			unless session[:admin_id]
				flash[:notice] = "Please log in"
				redirect_to(admin_access_login_path)
			end
		end

		def staff_logged_in
			unless session[:member_id]
				flash[:notice] = "Please log in"
				redirect_to(staff_access_login_path)
			end
		end

		def customer_logged_in
			unless session[:customer_id]
				flash[:notice] = "Please log in"
				redirect_to(account_access_login_path)
			end
		end

end
