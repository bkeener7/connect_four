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
        @board.columns[@user_selection[0]].play_piece(@user_selection[1])
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

    # def diagonal_leftup

    # end

    # def diagonal_rightup

    # end

    # def connect_four

    ## checks all 4 win conditions 

    # end

end