class Pokemon < ApplicationRecord
    has_many :parties 
    has_many :users, through: :parties
end
