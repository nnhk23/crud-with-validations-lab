class Song < ApplicationRecord
    validates :title, uniqueness: true, length: {minimum: 1}
    validate :valid_release_year

    def valid_release_year
        if self.released && !self.release_year 
            errors.add(:release_year, "is missing.")
        elsif self.released && self.release_year.to_i > Time.now.year.to_i
            errors.add(:release_year, "has to be present year and backward.")
        else
            self.release_year
        end
    end
end
