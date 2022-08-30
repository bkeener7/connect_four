require 'rspec'
require '/lib/row'

RSpec.describe Row do

    xit "exists" do

        row = Row.new
        
        expect(row).to be_an_instance_of(Row)
    end

    xit "has two readable attributes 'occupied' and 'player1' that toggleable true or false" do

        row = Row.new

        expect(row.occupied). to eq(FALSE)      #Initial state of attributes should be FALSE

        expect(row.player1).to eq(TRUE)         #Defaults to player1

        row.toggle_occupied                      #Calling the toggle method on the occupied attribute

        row.toggle_player1                       #Calling the toggle method on the player1 attribute

        expect(row.occupied). to eq(TRUE)

        expect(row.player1).to eq(TRUE)

    end

end
