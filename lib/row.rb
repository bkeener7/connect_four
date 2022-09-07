class Row
    attr_reader :player,
                :playable

    def initialize
        @player = ""
        @playable = false
    end

    def toggle_playable
        @playable = !@playable
    end

    def toggle_player(player)
        if  @playable == true
            @player = player
            toggle_playable
        else :invalid_move         
        end
    end
end