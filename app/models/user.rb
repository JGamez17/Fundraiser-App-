class User < ApplicationRecord
    has_many :donations
    has_many :raffles, through: :donations
    has_secure_password
end
