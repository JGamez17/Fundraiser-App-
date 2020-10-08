class SessionsController < ApplicationController
#loggin a user in, loggin a user out, omniauth
    def welcome
    end
    
    def new;end

    def omniauth #login with omniauth
        user = User.from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to raffles_path
        else
            flash[:message] = user.errors.full_message.join(", ")
            redirect_to '/login'
        end
    end
    
    def create 
        @user = User.find_by(username: params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id] = @user.id
            redirect_to raffles_path
        else
            flash[:danger] = 'Invalid email/password combination' 
            render :new
        end
    end

    def destroy 
        # byebug
        session.clear
        redirect_to '/' #change to home page 
    end 


    private
    def auth
        request.env['omniauth.auth']
    end
end
