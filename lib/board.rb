class Board

    attr_reader :columns

    def initialize

        @columns = []

    end


    def generate_columns

        7.times do
            @columns << Column.new
        end

    end

    def fill_columns_with_rows

        i = 0

        7.times do
            @columns[i].generate_rows
            i += 1
        end




    end


end

