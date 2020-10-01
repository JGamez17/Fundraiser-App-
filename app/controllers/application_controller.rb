class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user 
        @user ||= User.find_by_id(session[:user_id])
    end

    # def if_logged_in redirect to donations_path 

    # end
end
