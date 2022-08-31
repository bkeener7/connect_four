require 'rspec'
require './lib/row'


RSpec.describe Row do
    
    it "exists" do

        row = Row.new('Bryan')
        expect(row).to be_an_instance_of(Row)

    end

    it "has two readable attributes 'occupied' and 'player'" do

        row = Row.new()
        expect(row.occupied).to eq(false)      #Initial state of attributes should be FALSE
        expect(row.player).to eq('') 

    end

    it 'has an empty default player' do

        row = Row.new()
        expect(row.player).to eq('')

    end

    it "can have a player name" do

        row = Row.new('Mostafa')
        expect(row.occupied).to eq(false)      #Initial state of attributes should be FALSE
        expect(row.player).to eq("Mostafa") 

    end

    it 'has a method to toggle occupied attribute' do

        row = Row.new()
        expect(row.occupied).to eq(false)  
        row.toggle_occupied                         #Calling the toggle method on the occupied attribute
        expect(row.occupied).to eq(true)
        row.toggle_occupied
        expect(row.occupied).to eq(false)  

    end

end
