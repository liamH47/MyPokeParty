class User < ApplicationRecord
    has_many :parties 
    has_many :pokemons, through: :parties
end
