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

        expect(row.player1).to eq(TRUE)         #Player1 = TRUE represents player 1

    end

    xit "has a method to toggle occupied attribute to TRUE" do

        row = Row.new

        expect(row.occupied). to eq(FALSE)      #Initial state of attributes should be FALSE

        expect(row.player1).to eq(TRUE)         #Defaults to player1


        row.toggle_occupied                      #Calling the toggle method on the occupied attribute

        expect(row.occupied). to eq(TRUE)   

    end

    xit "it has a method to toggle player1 attribute to false" do

        row = Row.new

        row.toggle_player1

        expect(row.occupied). to eq(TRUE)      #Initial state of attributes should be FALSE
    
        expect(row.player1).to eq(FALSE)        #Player1 = FALSE represents player 2

    end

    xit "toggle_player1 also makes row occupied" do

        row = Row.new

        row.toggle_occupied
        
        row.toggle_player1

        expect(row.occupied). to eq(FALSE)     #Game Logic-wise this makes no difference from occupied = FALSE and player1 =TRUE
    
        expect(row.player1).to eq(FALSE)        


    end



end
