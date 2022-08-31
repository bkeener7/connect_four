require 'rspec'
require './lib/row'
require './lib/column'
require 'pry'

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

    it '3. fills the rows attribute with 6 instances of the row class' do

        column = Column.new

        expect(column.rows).to eq([])

        column.generate_rows

        expect(column.rows.length).to eq(6)
        expect(column.rows[0]).to be_an_instance_of(Row)
        expect(column.rows[5]).to be_an_instance_of(Row)

    end

    it '4. fills the next available row with current players piece' do

        column = Column.new

        column.generate_rows

        expect(column.rows[5].occupied).to eq(false)
        expect(column.rows[5].player).to eq('')
        column.play_piece("Bryan")
        expect(column.rows[5].occupied).to eq(true)
        expect(column.rows[5].player).to eq('Bryan')

        expect(column.rows[4].occupied).to eq(false)
        expect(column.rows[4].player).to eq('')
        column.play_piece("Bryan")
        expect(column.rows[4].occupied).to eq(true)
        expect(column.rows[4].player).to eq('Bryan')

    end

    it '5. only plays in valid spaces' do

        column = Column.new

        column.generate_rows

        expect(column.rows[5].playable).to eq(true)
        expect(column.rows[4].playable).to eq(false)

        column.play_piece("Bryan")

        expect(column.rows[5].playable).to eq(false)
        expect(column.rows[4].playable).to eq(true)

        column.play_piece("Bryan")
        expect(column.rows[5].playable).to eq(false)
        expect(column.rows[4].playable).to eq(false)
        expect(column.rows[3].playable).to eq(true)

    end

    it '6. adds player name to row when playing piece' do

        column = Column.new

        column.generate_rows

        expect(column.rows[5].player).to eq('')
        column.play_piece("Bryan")
        expect(column.rows[5].player).to eq('Bryan')

        expect(column.rows[4].player).to eq('')
        column.play_piece("Mostafa")
        expect(column.rows[4].player).to eq('Mostafa')

    end

end


# - all columns are present (A-G); (columnA = Column.new()) ---> for board in future


