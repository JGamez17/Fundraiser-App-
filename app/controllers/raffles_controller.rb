class RafflesController < ApplicationController

    def index
        @raffles = Raffle.all 
    end

    def show
        set_raffle
    end

    def new 
        @raffle = Raffle.new
    end

    def create 
        @raffle = Raffle.new(raffle_params) #ActiveRecord is instaniating an object
        if @raffle.valid? && @raffle.save
            redirect_to raffle_path(@raffle)
        else render :new
        end
    end

    def edit 
        set_raffle
    end

    def update
        set_raffle
        if @raffle.update(raffle_params)
             redirect_to raffle_path(@raffle)
        else render :edit
        end
    end

    def destroy 
        set_raffle
        @raffle.destroy
        redirect_to raffles_path
    end

    private
        def raffle_params
            params.require(:raffle).permit(:ticket_price, :name_of_raffle)
        end

        def set_raffle
            @raffle = Raffle.find_by_id(params[:id])
        end

end
