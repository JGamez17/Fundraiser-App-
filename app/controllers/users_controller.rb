class UsersController < ApplicationController
    #loading the signup form
    def new 
        @user = User.new
    end

    def show 
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
    #signup 

    def create 
        @user = User.new(user_params)
        if @user.save #will attempt to save to DB but before render validations
            flash[:success] = "Welcome to Ana's Legacy!"
            session[:user_id] = @user.id
            redirect_to raffles_path
        else 
            render :new
        end
    end

    def edit 
        @user = User.find_by_id(params[:id])
    end

    def update
        @user = User.find_by_id(params[:id])
        if @user.update(user_params)
             redirect_to user_path(@user)
        else render :edit
        end
    end
    
    private

        def user_params
            params.require(:user).permit(:username, :password)
        end
end
