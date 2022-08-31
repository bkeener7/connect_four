require 'rspec'
require './lib/row'


RSpec.describe Row do
    
    it "exists" do

        row = Row.new
        expect(row).to be_an_instance_of(Row)

    end

    it "has three readable attributes 'occupied', 'player', and 'playable'" do

        row = Row.new
        expect(row.occupied).to eq(false)      #Initial state of attributes should be FALSE
        expect(row.player).to eq('') 
        expect(row.playable).to eq(false)

    end


    it "can add a player name" do

        row = Row.new

        row.toggle_player('Bryan')
        
        expect(row.player).to eq("Bryan") 

    end

    it 'has a method to toggle occupied attribute' do

        row = Row.new

        expect(row.occupied).to eq(false)  
        row.toggle_occupied                         #Calling the toggle method on the occupied attribute
        expect(row.occupied).to eq(true)
        row.toggle_occupied
        expect(row.occupied).to eq(false)  

    end

    it "can toggle playable attribute" do

        row = Row.new

        expect(row.playable).to eq(false)  
        row.toggle_playable                         
        expect(row.playable).to eq(true)
        row.toggle_playable
        expect(row.playable).to eq(false)  
        
    end 

end
