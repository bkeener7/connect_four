require 'pry'
class Column

    attr_reader :rows, :count

    def initialize(rows = [])
        @rows = rows
        @count = 5
    end

    def generate_rows
        6.times do
            @rows << Row.new()
        end
        @rows[5].toggle_playable
    end
    
    
    def play_piece
            if @rows[count].playable == true
                @rows[count].toggle_occupied 
                @rows[count].toggle_playable          
                @rows[count - 1].toggle_playable
            end
            @count -= 1 #make sure to address line 23 possibly becoming negative
    end

end