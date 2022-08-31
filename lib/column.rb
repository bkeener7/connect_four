require 'pry'
class Column

    attr_reader :rows, :count

    def initialize(rows = [])   #was there a reason we made this dynamic?
        @rows = rows
        @count = 5
    end

    def generate_rows
        6.times do
            @rows << Row.new()
        end
        @rows[5].toggle_playable
    end
    
    
    def play_piece(player)
            if @rows[count].playable == true
                @rows[count].toggle_occupied 
                @rows[count].toggle_player(player)
                @rows[count].toggle_playable          
                @rows[count - 1].toggle_playable
            end

            if count > 1
            @count -= 1 #make sure to address line 23 possibly becoming negative
            end
    end

end