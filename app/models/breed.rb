class Breed < ActiveRecord::Base
    has_many :pets
    has_many :user_breeds
    has_many :users, through: :user_breeds
end