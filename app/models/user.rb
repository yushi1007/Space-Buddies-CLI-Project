class User < ActiveRecord::Base
    has_many :user_breeds
    has_many :breeds, through: :user_breeds
end