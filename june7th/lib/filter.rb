class Filter 
    UPPER_DEFAULT = 1000
    LOWER_DEFAULT = 40
    def bandpass(track, upper = UPPER_DEFAULT, lower = LOWER_DEFAULT)
        updated_track = []
        value_check(track)
        track.each do | note | 
            if note > upper 
                updated_track.push(upper)
            elsif note < lower 
                updated_track.push(lower) 
            else 
                updated_track.push(note)
            end 
        end
        return updated_track
    end 

    def value_check(array)
        array.each do | note |
            fail "non positive integer value present" if (note != Integer) || note < 1 && note.Integer? 
        end 
    end
end 