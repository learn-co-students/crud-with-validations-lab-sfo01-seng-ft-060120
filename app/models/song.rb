class Song < ApplicationRecord
    validates :title, :artist_name, presence: true
    validates :title, uniqueness: { scope: :release_year, message: "Song can be released once per year" }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Date.current.year }, allow_blank: true

    # def released?
    #     self.released == true
    # end
end
