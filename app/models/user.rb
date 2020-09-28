class User < ApplicationRecord
    has_many :donations
    has_many :raffles, through: :donations
    has_secure_password
    validates :username, uniqueness :true 
end
