class Board
  attr_reader :columns,
              :column_index,
              :row_index,
              :layout_index,
              :layout

  attr_accessor :player_1,
                :player_2

  def initialize
    @player_1 = ''
    @player_2 = ''
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
    if @columns[@column_index].rows[@row_index].player == @player_1 && @columns[@column_index].rows[@row_index].player != ''
      @layout[@layout_index] = 'x'
    elsif @columns[@column_index].rows[@row_index].player == @player_2 && @columns[@column_index].rows[@row_index].player != ''
      @layout[@layout_index] = 'o'
    else
      @layout[@layout_index] = '.'
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
end

# Board array to string reference key:
# column[0].row[0] is layout[16]
# column[6].row[0] is layout[28]
# column[0].row[1] is layout[30]
