class Pet < ActiveRecord::Base
    has_many :user_pets
    has_many :users, through: :user_pets
    belongs_to :breed
end