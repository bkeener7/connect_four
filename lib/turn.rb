class Turn

    attr_reader :user_selection
    def initialize
        @column_conversion = {'A' => 0, 'B' => 1, 'C' => 3, 'D' => 4, 'E' => 5, 'F' => 6, 'G' => 7}
        @user_selection = []
    end

    def column_select (user_selection, player)
        @user_selection = [@column_conversion[user_selection], player]
    end   

end