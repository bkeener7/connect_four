require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/game'
require 'pry'

RSpec.describe Game do

  it "1. exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  xit "2. has two attributes: player1 and player2 that default to blank" do
    game = Game.new
    expect(game.player1).to eq("")
    expect(game.player2).to eq("")
  end

  xit "3. has a main menu" do
    game = Game.new
    expect(game.main_menu_message).to eq("\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n")
  end



  # xit "4. gives a prompt to choose opponent" do
  #   expect(game.choose_opponent).to eq("\nType 'Computer' to play against computer or 'Player' to play against another player\n")
  # end

  


end