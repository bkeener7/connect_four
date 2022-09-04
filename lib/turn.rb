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

  def diagonal_rightup
    #these represent the six arrays that a right_up diagonal win can occur in
    arr1 = [board.columns[0].rows[3], board.columns[1].rows[2], board.columns[2].rows[1], board.columns[3].rows[0]]
    arr2 = [board.columns[0].rows[4], board.columns[1].rows[3], board.columns[2].rows[2], board.columns[3].rows[1], board.columns[4].rows[0]]
    arr3 = [board.columns[0].rows[5], board.columns[1].rows[4], board.columns[2].rows[3], board.columns[3].rows[2], board.columns[4].rows[1], board.columns[5].rows[0]]
    arr4 = [board.columns[1].rows[5], board.columns[2].rows[4], board.columns[3].rows[3], board.columns[4].rows[2], board.columns[5].rows[1], board.columns[6].rows[0]]
    arr5 = [board.columns[2].rows[5], board.columns[3].rows[4], board.columns[4].rows[3], board.columns[5].rows[2], board.columns[6].rows[1]]
    arr6 = [board.columns[3].rows[5], board.columns[4].rows[4], board.columns[5].rows[3], board.columns[6].rows[2]]

    right_up = [arr1, arr2, arr3, arr4, arr5, arr6]

  end

  def diagonal_leftup
    #these represent the six arrays that a left_up diagonal win can occur in
    arr1 = [board.columns[3].rows[5], board.columns[2].rows[4], board.columns[1].rows[3], board.columns[0].rows[2]]
    arr2 = [board.columns[4].rows[5], board.columns[3].rows[4], board.columns[2].rows[3], board.columns[1].rows[2], board.columns[0].rows[1]]
    arr3 = [board.columns[5].rows[5], board.columns[4].rows[4], board.columns[3].rows[3], board.columns[2].rows[2], board.columns[1].rows[1], board.columns[0].rows[0]]
    arr4 = [board.columns[6].rows[5], board.columns[5].rows[4], board.columns[4].rows[3], board.columns[3].rows[2], board.columns[2].rows[1], board.columns[1].rows[0]]
    arr5 = [board.columns[6].rows[4], board.columns[5].rows[3], board.columns[4].rows[2], board.columns[3].rows[1], board.columns[2].rows[0]]
    arr6 = [board.columns[6].rows[3], board.columns[5].rows[2], board.columns[4].rows[1], board.columns[3].rows[0]]

    left_up = [arr1, arr2, arr3, arr4, arr5, arr6]  

  end    

  # def connect_four

  ## checks all 4 win conditions 

  # end

end