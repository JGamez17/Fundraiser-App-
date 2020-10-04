class DonationsController < ApplicationController 

    def index
       @donations = Donations.all  
    end    

    def raffle_donation
       @donations = Donation.where(raffle_id: params[:id])
    end

    def new 
        # instantiate raffle based on params[:raffle_id]
        @raffle = Raffle.find_by_id(params[:raffle_id])
        @donation = Donation.new
    end

    def show
        @donation = Donation.find_by_id(params[:id])
    end

    def create 
        @raffle = Raffle.find_by_id(params[:raffle_id])
        # instantiate raffle based on params[:raffle_id]
        # donation_params.merge(params[:raffle_id])
        @donation = current_user.donations.new(donation_params)
        @donation.raffle = @raffle 
        if @donation.save
            redirect_to donation_params
         else render :new
     end
    end

    private
        def donation_params
            params.require(:donation).permit(:number_of_tickets, raffle_attributes: %i[ticket_price])
        end
end
