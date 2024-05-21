class User < ApplicationRecord

    has_secure_password

    has_many :products
    has_many :buys

    validates :name, presence: true
    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
    validates :mobile_nu, presence: true
    
end
