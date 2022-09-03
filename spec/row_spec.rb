require 'rspec'
require './lib/row'

RSpec.describe Row do
  it "exists" do
    row = Row.new
    expect(row).to be_an_instance_of(Row)
  end

  it "has two default attributes 'playable' is false and 'player' is blank" do
    row = Row.new
    expect(row.player).to eq("") 
    expect(row.playable).to eq(false)
  end

  it 'has playable rows and a player can play a piece, then the row is occupied' do
    row = Row.new
    row.toggle_playable
    expect(row.playable).to eq(true)

    row.toggle_player("Mostafa")
    expect(row.player).to eq("Mostafa")
    expect(row.playable).to eq(false)
  end

  it 'prints an error message if player tries to make an invalid move' do
    row = Row.new
    expect(row.playable).to eq(false)
    expect(row.toggle_player("Mostafa")).to eq(:invalid_move)
  end
end
