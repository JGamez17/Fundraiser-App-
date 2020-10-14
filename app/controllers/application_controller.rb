class ApplicationController < ActionController::Base
 helper_method :current_user

 private
   def is_logged_in?
      !!current_user  #if logged_in = true
   end

   def require_login
      if !is_logged_in?
         redirect_to login_path
      end
   end

   def current_user 
       @user ||= User.find_by_id(session[:user_id])
   end

end
