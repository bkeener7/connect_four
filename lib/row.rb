class Row
    attr_reader :player, :occupied

    def initialize(player = "")
        @player = player
        @occupied = false
    end

    def toggle_occupied
        @occupied = !@occupied
    end
    
end