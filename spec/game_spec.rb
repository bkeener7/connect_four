require 'rspec'
require './lib/row'
require './lib/column'
require'./lib/board'
require'./lib/Game'
require 'pry'

RSpec.describe Game do

  it "1. exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "2. has two attributes: player1 and player2 that default to blank" do
    game = Game.new
    expect(game.player_1).to eq("")
    expect(game.player_2).to eq("")
  end

  it "3. has a main menu" do
    game = Game.new
    expect(game.main_menu_message).to eq("\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n")
  end

  # it ". gives a prompt to choose opponent" do
  #   game = Game.new
  #   expect(game.choose_opponent_prompt).to eq("\nType 'Computer' to play against computer or 'Player' to play against another player\n")
  # end

end