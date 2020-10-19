class Raffle < ApplicationRecord
    has_many :donations
    has_many :users, through: :donations
    validates :name_of_raffle, presence: true 
    validates :ticket_price, presence: { message: 'Please enter price'}

    def self.search(search)
        # byebug
       @raffles = Raffle.where('name_of_raffle = ?', "%#{search}%")
    end
end
