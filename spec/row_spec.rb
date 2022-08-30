require 'rspec'
require '/lib/row'

RSpec.describe Row do

    xit "exists" do

        row = Row.new
        
        expect(row).to be_an_instance_of(Row)
    end

    xit "has two readable attributes 'occupied' and 'player'" do

        row = Row.new("Bryan")

        expect(row.occupied).to eq(false)      #Initial state of attributes should be FALSE

        expect(row.player).to eq("Bryan")     

    end

    xit "Can have different player names" do

        row = Row.new("Mostafa")

        expect(row.occupied).to eq(false)      #Initial state of attributes should be FALSE

        expect(row.player).to eq("Mostafa")     

    end

    xit "has a method to toggle occupied attribute to TRUE" do

        row = Row.new("Bryan")

        expect(row.occupied).to eq(false)      

        row.toggle_occupied                         #Calling the toggle method on the occupied attribute

        expect(row.occupied).to eq(true)   

    end




end
