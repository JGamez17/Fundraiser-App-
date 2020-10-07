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

    def raffle_donation
       @donations = Donation.where(raffle_id: params[:id])
    end

    def new
        #check if it's nested & it's a proper id
        if params[:raffle_id] && raffle = Raffle.find_by_id(params[:raffle_id])
          #nested route
          @donation = raffle.donations.build #has_many
        else
          #unnested
          @donation = Donation.new
          @donation.build_raffle  #belongs_to
        end
      end

    def create 
      @donation = current_user.donations.build(donation_params)
        if @donation.save
            redirect_to donation_path(@donation)
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
            params.require(:donation).permit(:number_of_tickets, :donation_amount, :raffle_attributes, :raffle_id)
        end
end
