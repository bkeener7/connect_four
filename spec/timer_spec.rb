require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/turn'
require './lib/game'
require './lib/timer'

RSpec.describe Timer do

    it '1. exists' do
        timer = Timer.new
        expect(timer).to be_an_instance_of(Timer)
    end

    it '2. counts time' do
        timer = Timer.new
        expect(timer.time_start).to eq(Time.now.to_i)
        expect(timer.time_end).to eq(Time.now.to_i)
    end

    it '3. gives time elapsed in seconds' do
        timer = Timer.new

        timer.time_start
        #this will cause test to wait 2 seconds
        sleep(2)
        timer.time_end
        #elapsed time should equal 5 seconds
        expect(timer.time_elapsed).to eq(2)       

    end

    it '4. records time' do
        timer = Timer.new
        
        


    end



end