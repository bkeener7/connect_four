require 'rspec'

#this test will check:
# - all columns are present (A-G); (columnA = Column.new())
# - column can be selectable and fillable
# - column will know valid and invalid spaces
# - the player will only make valid moves (e.g. fills bottom row first)
#       - pieces will be a method established in row
# - nothing will be passed through intialize at first, afterwords player will be passed through
# - row will be default attribute (array)
# - row will be looped into an array six times for each column (method)
# - static attributes: blank array for row

RSpec.describe Row do
    
    it "exists" do

        row = Column.new
        expect(row).to be_an_instance_of(Row)

    end

end