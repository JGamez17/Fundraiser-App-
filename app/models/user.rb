class User < ApplicationRecord
    has_many :donations
    has_many :raffles, through: :donations
    has_secure_password
    validates :username, uniqueness: true 
end


# add to form <%=f.label "password_digest_confirmation:" min 41 