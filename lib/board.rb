class Board

    attr_reader :columns,
                :player1,
                :player2,
                :column_index,
                :row_index,
                :layout_index,
                :layout

    def initialize(player1, player2)
        @player1 = player1
        @player2 = player2 
        @columns = []
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

    def layout_print

        print @layout

        #column[0].row[0] is layout[16]
        #column[6].row[0] is layout[28]
        #column[0].row[1] is layout[30]

    end

    def update_layout

        board_logic_loop

        @column_index = 0
        @row_index = 0
        @layout_index = 16

    end

    def board_logic

        if @columns[@column_index].rows[@row_index].player == @player1
            @layout[@layout_index] = "x"
        elsif @columns[@column_index].rows[@row_index].player == @player2
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


end

#generate board on this file and make appropriate tests

