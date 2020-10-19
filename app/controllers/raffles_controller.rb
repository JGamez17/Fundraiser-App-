class RafflesController < ApplicationController
    before_action :require_login, except: [:index]
    before_action :set_raffle, only: [:show, :edit, :update, :destroy]

    def index
        if params[:search]
            @raffles = Raffle.search(params[:search])
        else
            @raffles = Raffle.all
        end
    end

    def show
        @donations = @raffle.donations
    end

    def new
        @raffle = Raffle.new
    end

    def create
        @raffle = Raffle.new(raffle_params) #ActiveRecord is instaniating an object
        if @raffle.valid? && @raffle.save
            redirect_to raffles_path(@raffle)
        else
            render :new
        end
    end

    def edit;end

    def update
        if @raffle.update(raffle_params)
             redirect_to raffle_path(@raffle)
        else
            render :edit
        end
    end

    def destroy
        @raffle.destroy
        redirect_to raffles_path
    end

    private
        def raffle_params
            params.require(:raffle).permit(:ticket_price, :name_of_raffle, :search)
        end

        def set_raffle
            @raffle = Raffle.find_by_id(params[:id])
        end

end
