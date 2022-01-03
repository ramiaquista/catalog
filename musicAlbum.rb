require './item'

class MusicAlboum < Item
    def initialize(publish_date, on_spotify: false)
        super(publish_date, archived: false)
        @on_spotify = on_spotify
    end
    
    def can_be_archived?
        date = Date.parse(@publish_date)
        current_date = Time.now
        puts current_date.year - date.year
        return true if current_date.year - date.year >= 10 && @on_spotify == true

        false
    end
end

