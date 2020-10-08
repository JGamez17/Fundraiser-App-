class Donation < ApplicationRecord
    belongs_to :user 
    belongs_to :raffle
    accepts_nested_attributes_for :raffle
    validate

    def self.find_by_raffle_id(id)
        self.where(raffle_id: id)
    end
end
