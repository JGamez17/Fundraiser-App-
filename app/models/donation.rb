class Donation < ApplicationRecord
    belongs_to :user 
    belongs_to :raffle
    accepts_nested_attributes_for :raffle
    
    validates :donation_amount, presence: true, uniqueness: true
    # validates :raffle_name, presence: true, uniqueness: true

    def self.find_by_raffle_id(id)
        self.where(raffle_id: id)
    end
end
