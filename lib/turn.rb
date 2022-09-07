class Turn
  attr_reader :user_selection, :board, :player, :column_conversion

  def initialize(player, board)
    @column_conversion = {'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4, 'F' => 5, 'G' => 6}
    @user_selection = []
    @board = board
    @player = player
  end

  def column_select (user_input)
    @user_selection = [column_conversion[user_input], player]
    board.columns[user_selection[0]].play_piece(user_selection[1])
  end   

  def column_win
    y = 0
    7.times do
      player_column = []
      x = 5

      6.times do
        player_column << board.columns[y].rows[x].player
        x -= 1
      end

      if player_column.chunk_while{ |a, b| a == b && a != "" }.any?{ |player| player.size >= 4 }
        return player_column.max_by{ |player| player_column.count(player) }
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
        player_row << board.columns[y].rows[x].player
        y += 1
      end

      if player_row.chunk_while{ |a, b| a == b && a != "" }.any?{ |player| player.size >= 4 }
        return player_row.max_by{ |player| player_row.count(player) }
      end

      x -= 1
    end
    :no_win
  end

  def diagonal_rightup
    #these represent the six arrays that a right_up diagonal win can occur in
    arr0 = [board.columns[0].rows[3].player, board.columns[1].rows[2].player, board.columns[2].rows[1].player, board.columns[3].rows[0].player]
    arr1 = [board.columns[0].rows[4].player, board.columns[1].rows[3].player, board.columns[2].rows[2].player, board.columns[3].rows[1].player, board.columns[4].rows[0].player]
    arr2 = [board.columns[0].rows[5].player, board.columns[1].rows[4].player, board.columns[2].rows[3].player, board.columns[3].rows[2].player, board.columns[4].rows[1].player, board.columns[5].rows[0].player]
    arr3 = [board.columns[1].rows[5].player, board.columns[2].rows[4].player, board.columns[3].rows[3].player, board.columns[4].rows[2].player, board.columns[5].rows[1].player, board.columns[6].rows[0].player]
    arr4 = [board.columns[2].rows[5].player, board.columns[3].rows[4].player, board.columns[4].rows[3].player, board.columns[5].rows[2].player, board.columns[6].rows[1].player]
    arr5 = [board.columns[3].rows[5].player, board.columns[4].rows[4].player, board.columns[5].rows[3].player, board.columns[6].rows[2].player]
    right_up = [arr0, arr1, arr2, arr3, arr4, arr5]
    
    #key checks are in arr0[0], arr1[1], arr2[2], arr3[2], arr4[1], arr5[0]
    #corresponding: right_up[0][0], right_up[1][1], right_up[2][2], right_up[3][2], right_up[4][1], right_up[5][0]
    check_right = [right_up[0][0], right_up[1][1], right_up[2][2], right_up[3][2], right_up[4][1], right_up[5][0]]
    
   if check_right.any? { |occupied| occupied.size > 0 }
      right_up.each do |arr|
        if arr.chunk_while{ |a, b| a == b && a != "" }.any?{ |player_piece| player_piece.size >= 4 }       
          return arr.max_by{ |player| arr.count(player) }
        end             
      end    
    end
    :no_win
  end

  def diagonal_leftup
    #these represent the six arrays that a left_up diagonal win can occur in
    arr0 = [board.columns[3].rows[5].player, board.columns[2].rows[4].player, board.columns[1].rows[3].player, board.columns[0].rows[2].player]
    arr1 = [board.columns[4].rows[5].player, board.columns[3].rows[4].player, board.columns[2].rows[3].player, board.columns[1].rows[2].player, board.columns[0].rows[1].player]
    arr2 = [board.columns[5].rows[5].player, board.columns[4].rows[4].player, board.columns[3].rows[3].player, board.columns[2].rows[2].player, board.columns[1].rows[1].player, board.columns[0].rows[0].player]
    arr3 = [board.columns[6].rows[5].player, board.columns[5].rows[4].player, board.columns[4].rows[3].player, board.columns[3].rows[2].player, board.columns[2].rows[1].player, board.columns[1].rows[0].player]
    arr4 = [board.columns[6].rows[4].player, board.columns[5].rows[3].player, board.columns[4].rows[2].player, board.columns[3].rows[1].player, board.columns[2].rows[0].player]
    arr5 = [board.columns[6].rows[3].player, board.columns[5].rows[2].player, board.columns[4].rows[1].player, board.columns[3].rows[0].player]
    left_up = [arr0, arr1, arr2, arr3, arr4, arr5]

    #key checks are in arr0[0], arr1[1], arr2[2], arr3[2], arr4[1], arr5[0]
    #corresponding: left_up[0][0], left_up[1][1], left_up[2][2], left_up[3][2], left_up[4][1], left_up[5][0]
    check_left = [left_up[0][0], left_up[1][1], left_up[2][2], left_up[3][2], left_up[4][1], left_up[5][0]]

    if check_left.any? { |occupied| occupied.size > 0 }
      left_up.each do |arr|
        if arr.chunk_while{ |a, b| a == b && a != "" }.any?{ |player_piece| player_piece.size >= 4 }       
          return arr.max_by{ |player| arr.count(player) }
        end             
      end    
    end
    :no_win
  end

  
  def stalemate_check
    #check top array at end of connect_four if :no_win and if all full then :stalemate
    arr_top = [board.columns[0].rows[0].player, board.columns[1].rows[0].player, board.columns[2].rows[0].player, board.columns[3].rows[0].player, board.columns[4].rows[0].player, board.columns[5].rows[0].player, board.columns[6].rows[0].player]
    
    if arr_top.all?{ |occupied| occupied != "" }
      :stalemate
    end
  end

  def connect_four
    win_check = [column_win, row_win, diagonal_rightup, diagonal_leftup]
    if win_check.any?{ |win| win != :no_win }
      return win_check.tally.invert[1]
    elsif stalemate_check == :stalemate
      return :stalemate
    end
    :no_win
  end
end