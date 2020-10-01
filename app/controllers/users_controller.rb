class UsersController < ApplicationController

    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save #will attempt to save to DB but before render validations
            session[:user_id] = @user.id
            redirect_to home_path
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

    def destroy 
        @user = User.find_by_id(params[:id])
        if @user.delete 
            redirect_to "homepage"
        else redirect_to user_path(@user)
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password)
        end

end
