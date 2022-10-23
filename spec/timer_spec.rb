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
  end

  it '3. gives time elapsed in seconds' do
    timer = Timer.new

    t1 = timer.time_start
    # this will cause test to wait 2 seconds
    sleep(2)
    # elapsed time should equal 2 seconds
    t2 = Time.now.to_i
    expect(t2 - t1).to eq(2)
  end

  it '4. can detect current players fastest win' do
    timer = Timer.new

    timer.player1_stats[:player_name] = 'Bryan'
    timer.player1_stats[:wins] = 4,
                                 timer.player1_stats[:win_times_seconds].push(6, 189, 34, 75)
    expect(timer.fastest_win('Bryan')).to eq(6)
  end

  it '5. will record a win and time taken' do
    timer = Timer.new

    timer.time_start
    sleep(2)
    timer.player1_stats[:player_name] = 'Bryan'
    expect(timer.player1_stats[:wins]).to eq(0)

    timer.record_win('Bryan')
    expect(timer.player1_stats[:wins]).to eq(1)
    expect(timer.player1_stats[:win_times_seconds]).to eq([2])
  end
end
