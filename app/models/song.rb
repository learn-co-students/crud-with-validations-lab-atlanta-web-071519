class Song < ApplicationRecord
    validates :title, presence: true
    validate :repeat_title

    # if released is true 
    # must also somehow validate that the release_year must be less than or equal to the current year
    validate :valid_year

    def repeat_title
        Song.all.each do |song|
            if(song.title == title && song.artist_name == artist_name && song.release_year == release_year && title != nil)
                errors.add(:repeat_title, "ERROR")
            end
        end
    end

    def valid_year
        # binding.pry
        if(released)
            if(release_year.present? && release_year > Date.today.year)
                errors.add(:valid_year, "ERROR")
            elsif(!release_year.present?)
                errors.add(:valid_year, "ERROR")
            end
        end
    end

end
