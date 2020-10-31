class User < ApplicationRecord
    has_many :rides
    has_many :attractions, through: :rides
    has_secure_password

    def mood
        # binding.pry
        if self.nausea && self.happiness
            self.nausea < self.happiness ? "happy" : "sad"
        else
            "Shoulder shrug"
        end
    end

end
