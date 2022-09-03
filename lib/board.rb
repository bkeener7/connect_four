class Board
  attr_reader :columns,
              :player_1,
              :player_2,
              :column_index,
              :row_index,
              :layout_index,
              :layout

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2 
    @columns = []
    generate_columns
    @column_index = 0
    @row_index = 0
    @layout_index = 16
    @layout = "\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n"
  end

  def generate_columns
    7.times do
      @columns << Column.new
    end
  end

  def print_layout
    print @layout
  end

  def update_layout
    board_logic_loop
    @column_index = 0
    @row_index = 0
    @layout_index = 16
  end

  def board_logic
    if @columns[@column_index].rows[@row_index].player == @player_1
      @layout[@layout_index] = "x"
    elsif @columns[@column_index].rows[@row_index].player == @player_2
      @layout[@layout_index] = "o"
    end
  end

  def board_logic_loop
    42.times do
      if @column_index == 7
        @column_index = 0
        @row_index += 1
      end
     board_logic
     @column_index += 1
     @layout_index += 2
    end
  end

  def column_win
    y = 0
    7.times do
      player_column = []
      x = 5

      6.times do
        player_column << columns[y].rows[x].player
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
        player_row <<columns[y].rows[x].player
        y += 1
      end

      if player_row.chunk_while(&:==).any?{ |player| player.size == 4}
        return player_row.max_by{ |player| player_row.count(player)}
      end

      x -= 1
    end
    :no_win
  end

end

  # def column_win
  #   x = 0
  #   loop do
  #     player_column = []
  #     y = 5
  #     loop do
  #       player_column << columns[x].rows[y].player
  #       if player_column.each_index.select{|i| player_column[i] == "Bryan" } == [0, 1, 2, 3] || [1, 2, 3, 4] || [2, 3, 4, 5]
  #         return "Bryan"
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



#Board array to string reference key:
#column[0].row[0] is layout[16]
#column[6].row[0] is layout[28]
#column[0].row[1] is layout[30]



