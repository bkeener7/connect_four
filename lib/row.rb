class Row
    attr_reader :player, :occupied, :playable

    def initialize
        @player = ""
        @occupied = false
        @playable = false
    end

    def toggle_occupied
        @occupied = !@occupied
    end

    def toggle_playable
        @playable = !@playable
    end

    def toggle_player(player)
        @player = player
    end
    
end