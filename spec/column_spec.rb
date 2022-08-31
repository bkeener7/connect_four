require 'rspec'
require './lib/column'
require './lib/row'
require './lib/column'

#this test will check:
# - column can be selectable and fillable
# - column will know valid and invalid spaces
# - the player will only make valid moves (e.g. fills bottom row first)
# - pieces will be a method established in row
# - establishing which player is occupied in which spot
# - nothing will be passed through intialize at first, afterwords player will be passed through
# - row will be default attribute (array)
# - row will be looped into an array six times for each column (method)
# - static attributes: blank array for row

RSpec.describe Column do

    it '1. exists' do

        column = Column.new()
        expect(column).to be_an_instance_of(Column)

    end



    it '2. it has an array attribute rows' do        

        column = Column.new

        expect(column.rows).to eq([])


    end

    it 'fills the rows attribute with 6 instances of the row class' do

        column = Column.new

        expect(column.rows).to eq([])

        row_1 = Row.new()
        row_2 = Row.new()
        row_3 = Row.new()
        row_4 = Row.new()
        row_5 = Row.new()
        row_6 = Row.new()

        column.generate_rows

        expect(column.rows).to eq([row_1, row_2, row_3, row_4, row_5, row_6])

    end

        



end


# - all columns are present (A-G); (columnA = Column.new()) ---> for board in future


