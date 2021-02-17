class Pet < ActiveRecord::Base
    belongs_to :breed

    def to_s
     self.name 
    end 
end