class DonationsController < ApplicationController 
    # before_action :require_login

    def index
        if params[:raffle_id]
            @donations = Donation.find_by_raffle_id(params[:raffle_id])
        else
            Donations.all
        end
        @donations = Donation.where(raffle_id: params[:id])
    end

    # def raffle_donation
    #    @donations = Donation.where(raffle_id: params[:id])
    # end

    def new
        # byebug
     @donation = Donation.new
    end

    def create #all donations will be made through nested routes 
      @donation = Donation.new(donation_params)
      @donation.user_id = current_user.id
   
        if @donation.save
           redirect_to raffle_path(params[:donation][:raffle_id])
         else 
            render :new
        end
    end

    def show
        set_donation   
    end

    private

        def set_donation
            @donation = Donation.find_by_id(id: params[:id])
            if !@donation
                redirect_to donations_path
            end
        end

        def donation_params
            params.require(:donation).permit(:number_of_tickets, :donation_amount, :donation_frequency, :raffle_id)
        end
end
