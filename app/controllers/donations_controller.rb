class DonationsController < ApplicationController

    def index
        @donations = Donations.all 
    end

    def new 
        # instantiate raffle based on params[:raffle_id]
        @donation = Donation.new
    end

    def show
        @donation = Donation.find_by_id(params[:id])
    end

    def create 
        @raffle = Raffle.new(params)
        # instantiate raffle based on params[:raffle_id]
        # donation_params.merge(params[:raffle_id])
        @donation = current_user.donations.new(donation_params)
        if @donation.save
            redirect_to donation_path(@donation)
        else render :new
        end
    end

    private
        def donation_params
            params.require(:donation).permit(:number_of_tickets)
        end
end
