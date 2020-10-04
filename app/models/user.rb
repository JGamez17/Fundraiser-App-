class User < ApplicationRecord
    has_many :donations
    has_many :raffles, through: :donations
    has_secure_password #validation 
    validates :username, uniqueness: true 

    def self.from_omniauth(auth)
        find_or_create_by(username: auth[:info][:email]) do |user|
            user.password = SecureRandom.hex(15)
        end
    end
end