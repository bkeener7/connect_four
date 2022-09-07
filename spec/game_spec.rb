require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/turn'
require './lib/game'

RSpec.describe Game do

  it "1. exists" do
    game = Game.new
    expect(game).to be_an_instance_of(Game)
  end

  it "2. has an instance of the Board class as an attribute" do
    game = Game.new

    expect(game.board).to be_an_instance_of(Board)
  end

  it "3. can check if player 1 will play against bot which by default is false" do
    game = Game.new

    expect(game.is_bot?).to eq(false)
  end


  it "4. bot only has columns A through G as options to select" do
    game = Game.new

    expect(game.column_choices).to eq(["A", "B", "C", "D", "E", "F", "G"])
  end

  it "5. has random bot selection by shuffling the choices A through G and always returning first element" do
    game = Game.new
    bot_selection_1 = ""
    bot_selection_2 = ""
    
    expect(game.column_choices).to eq(["A", "B", "C", "D", "E", "F", "G"])
    game.bot_selection
    expect(game.column_choices).not_to eq(["A", "B", "C", "D", "E", "F", "G"]) #may possibly randomly stay the same but statistically unlikely. If it ever breaks just rerun it.
    expect(game.column_choices).to include("A", "B", "C", "D", "E", "F", "G")
    bot_selection_1 = game.column_choices[0]
    game.bot_selection
    expect(game.column_choices).not_to eq(["A", "B", "C", "D", "E", "F", "G"])
    expect(game.column_choices).to include("A", "B", "C", "D", "E", "F", "G")
    bot_selection_2 = game.column_choices[0]
    expect(bot_selection_1).not_to eq(bot_selection_2) #Since it is a test for randomness, it can potentially fail. If you rerun it enough times, you should be able to get it to pass. This shows it is indeed random!
  end

  it "6. can only allow valid moves for the computer when it's the opponent" do
    game = Game.new

    game.set_bot
    game.set_player_turns
    expect(game.bot_selection_loop).not_to eq(:invalid_move)
  end

  it "7. has a welcome message" do
    game = Game.new
    expect(game.welcome_message).to eq("\nWelcome to CONNECT FOUR\nEnter 'P' to play. Enter 'QUIT' to exit at anytime.\n")
  end

  it "8. resets after the game is over" do
    game = Game.new

    game.set_bot
    game.set_player_turns
    game.bot_turn_sequence
    game.bot_turn_sequence
    game.bot_turn_sequence
    expect(game.turn_count).to eq(4)
    expect(game.board.layout).not_to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")

    game.game_reset
    expect(game.turn_count).to eq(1)
    expect(game.board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")
  end

  # it ". gives a prompt to choose opponent" do
  #   game = Game.new
  #   expect(game.choose_opponent_prompt).to eq("\nType 'Computer' to play against computer or 'Player' to play against another player\n")
  # end

end


