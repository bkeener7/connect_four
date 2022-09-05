require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/turn'
require './lib/Game'
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

  it "3. has an instance of the Board class as an attribute" do
    game = Game.new

    expect(game.board).to be_an_instance_of(Board)
  end

  it "4. can check if player 1 will play against bot which by default is false" do
    game = Game.new

    expect(game.is_bot?).to eq(false)
  end

  it "5. can set player 2 to be a bot" do
    game = Game.new

    expect(game.is_bot?).to eq (false)
    game.set_bot
    expect(game.is_bot?).to eq (true)
    expect(game.player_2).to eq("Computer")

  end

  it "6. bot only has columns A through G as options to select" do
    game = Game.new

    expect(game.bot_choices).to eq(["A", "B", "C", "D", "E", "F", "G"])
  end

  it "7. has random bot selection by shuffling the choices A through G and always returning first element" do
    game = Game.new
    bot_selection_1 = ""
    bot_selection_2 =""
    
    expect(game.bot_choices).to eq(["A", "B", "C", "D", "E", "F", "G"])
    game.bot_selection
    expect(game.bot_choices).not_to eq(["A", "B", "C", "D", "E", "F", "G"]) #may possibly randomly stay the same but statistically unlikely. If it ever breaks just rerun it.
    expect(game.bot_choices).to include("A", "B", "C", "D", "E", "F", "G")
    bot_selection_1 = game.bot_choices[0]
    game.bot_selection
    expect(game.bot_choices).not_to eq(["A", "B", "C", "D", "E", "F", "G"])
    expect(game.bot_choices).to include("A", "B", "C", "D", "E", "F", "G")
    bot_selection_2 = game.bot_choices[0]
    expect(bot_selection_1).not_to eq(bot_selection_2) #Since it is a test for randomness, it can potentially fail. If you rerun it enough times, you should be able to get it to pass. This shows it is indeed random!
  end


  it "8. has a welcome message" do
    game = Game.new
    expect(game.welcome_message).to eq("\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n")
  end

  

  # it ". gives a prompt to choose opponent" do
  #   game = Game.new
  #   expect(game.choose_opponent_prompt).to eq("\nType 'Computer' to play against computer or 'Player' to play against another player\n")
  # end

end
