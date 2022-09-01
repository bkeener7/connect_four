class Column

    attr_reader :rows, :count

    def initialize
        @rows = []
        @count = 5
        generate_rows
    end

    def generate_rows
        6.times do
            @rows << Row.new
        end
        @rows[5].toggle_playable
    end    
    
    def play_piece(player)
            if      @count > 0 && @rows[count].playable == true
                        @rows[count].toggle_player(player)         
                        @rows[count - 1].toggle_playable
                        @count -= 1
            elsif   @count == 0 && @rows[count].playable == true
                        @rows[count].toggle_player(player)
            else    puts "That is an invalid move." #evaluate later where best location is for this 
            end

    end

end