class Turn
    attr_reader :user_selection, :board

    def initialize(player, board)
        @column_conversion = {'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6}
        @user_selection = []
        @board = board
        @player = player
    end

    def column_select (user_selection)
        @user_selection = [@column_conversion[user_selection], @player]
    end   

    def column_win
      y = 0
      7.times do
        player_column = []
        x = 5
  
        6.times do
          player_column << @board.columns[y].rows[x].player
          x -= 1
        end
  
        if player_column.chunk_while(&:==).any?{ |player| player.size == 4}
          return player_column.max_by{ |player| player_column.count(player)}
        end
        
        y += 1
      end
      :no_win
    end
  
    def row_win
      x = 5
      6.times do
        player_row = []
        y = 0
  
        7.times do
          player_row << @board.columns[y].rows[x].player
          y += 1
        end
  
        if player_row.chunk_while(&:==).any?{ |player| player.size == 4}
          return player_row.max_by{ |player| player_row.count(player)}
        end
  
        x -= 1
      end
      :no_win
    end
  
  # end
  
    # def column_win
    #   x = 0
    #   loop do
    #     player_column = []
    #     y = 5
    #     loop do
    #       player_column << columns[x].rows[y].player
    #       if player_column.each_index.select{|i| player_column[i] == "Bryan" } == [0, 1, 2, 3] || [1, 2, 3, 4] || [2, 3, 4, 5]
    #         return "Dog"
    #         break
    #       elsif player_column.each_index.select{|i| player_column[i] == "Mostafa" } == [0, 1, 2, 3] || [1, 2, 3, 4] || [2, 3, 4, 5]
    #         return "Mostafa"
    #         break
    #       end
    #       y -= 1
    #       break if y == 0
    #     end
    #   x += 1
    #   break if x == 6
    #   end     
    # end
end