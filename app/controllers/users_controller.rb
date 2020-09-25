class UsersController < ApplicationController

    def index
        @users = User.all 
    end

    def new 
        @user = User.new
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else render :new
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
