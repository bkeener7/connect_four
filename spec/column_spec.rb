require 'rspec'
require './lib/column'
require './lib/row'

#this test will check:
# - column can be selectable and fillable
# - column will know valid and invalid spaces
# - the player will only make valid moves (e.g. fills bottom row first)
#       - pieces will be a method established in row
# - establishing which player is occupied in which spot
# - nothing will be passed through intialize at first, afterwords player will be passed through
# - row will be default attribute (array)
# - row will be looped into an array six times for each column (method)
# - static attributes: blank array for row

RSpec.describe Column do

    it '1. exists' do

        column = Column.new
        expect(column).to be_an_instance_of(Column)

    end

    xit '2. can be selectable' do
    
        column = Column.new

        
    end

    xit '3. will be fillable' do        

        columnA = Column.new
        columnB = Column.new
        columnC = Column.new
        columnD = Column.new
        columnE = Column.new
        columnF = Column.new
        columnG = Column.new


    end
end


# - all columns are present (A-G); (columnA = Column.new()) ---> for board in future

