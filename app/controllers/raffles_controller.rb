class RafflesController < ApplicationController
    def index
        @raffles = Raffle.all 
    end

    def new 
        @raffle = Raffle.new
    end

    def show
        @raffle = Raffle.find_by_id(params[:id])
    end

    def create 
        @raffle = Raffle.new(raffle_params)
        if @raffle.save
            redirect_to raffle_path(@raffle)
        else render :new
        end
    end

    def edit 
        @raffle = Raffle.find_by_id(params[:id])
    end

    def update
        @raffle = Raffle.find_by_id(params[:id])
        if @raffle.update(raffle_params)
             redirect_to raffle_path(@raffle)
        else render :edit
        end
    end

    def destroy 
        @raffle = Raffle.find_by_id(params[:id])
        if @raffle.delete 
            redirect_to "homepage"
        else redirect_to raffle_path(@raffle)
        end
    end

    private
        def raffle_params
            params.require(:raffle).permit(:ticket_price, :name_of_raffle)
        end

end
