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

end

#generate board on this file and make appropriate tests

