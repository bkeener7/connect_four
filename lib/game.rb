class Game 
  attr_reader :player_1,
              :player_2,
              :board,
              :column_choices,
              :turn_count

  def initialize
    @board = Board.new
    @is_bot = false
    @column_choices = ["A", "B", "C", "D", "E", "F", "G"]
    @player_1_turn = ""
    @player_2_turn = ""
    @player_1_selection = ""
    @turn_count = 1
  end

  def user_input
    input = gets.chomp
    abort if input.upcase == "QUIT"
    input
  end

    # def choose_opponent_prompt
  #   "\nType 'Computer' to play against computer or 'Player' to play against another player\n"
  # end
  #^there due to limitation on testing methods with user input.

  def set_player1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @board.player_1 = user_input
      @board.player_1 != "" ? break : (print "\nSorry. Please try again.")
    end
  end

  def set_player2
    loop do
      print "\nPlayer 2, please enter your name.\n"
      @board.player_2 = user_input
      @board.player_2 != "" ? break : (print "\nSorry. Please try again.")
    end
  end

  def is_bot?
    @is_bot
  end

  def set_bot
    @is_bot = true
    @board.player_2 = "Computer"
  end

  def welcome_message
    "\nWelcome to CONNECT FOUR\nEnter 'P' to play. Enter 'QUIT' to exit at anytime.\n"
  end

  def main_menu_user_input
    choice = user_input
    if choice.upcase == "P"
      set_player1
      set_bot
      "P"
    elsif choice.upcase == "QUIT"
      abort ":("
    else
      print "\nSorry, please try again.\n"
    end
  end

  def main_menu
    print welcome_message
    loop do
      break if main_menu_user_input == "P"
    end
  end

  def set_player_turns
    @player_1_turn = Turn.new(@board.player_1, @board) 
    @player_2_turn = Turn.new(@board.player_2, @board)
  end

  def player_1_selection_loop
    loop do
      print "\nTurn #{@turn_count} - #{@board.player_1}, please Select a column:\n"
      @player_1_selection = user_input
      if @column_choices.include?(@player_1_selection.upcase) == true && @player_1_turn.column_select(@player_1_selection.upcase) != :invalid_move
        break
      else 
        print "\nInvalid move."
      end
    end
  end

  def player_1_turn_sequence
    player_1_selection_loop
    @turn_count += 1
    @board.update_layout
    @board.print_layout
  end

  def bot_selection
    @column_choices = @column_choices.shuffle
    @column_choices[0]
  end

  def bot_selection_loop
    loop do
      bot_selection
      computer_selection = bot_selection
      break if @player_2_turn.column_select(computer_selection) != :invalid_move
    end
  end

  def bot_turn_sequence
      print "\nTurn #{@turn_count} - Computer turn:"
      bot_selection_loop
      @turn_count += 1
      board.update_layout
      @board.print_layout
  end
  
  def game_logic
      player_1_turn_sequence
      return (print "\n#{@board.player_1} wins!\n") if @player_1_turn.connect_four == @board.player_1
      bot_turn_sequence
      return (print "\n#{@board.player_2} wins!\n") if @player_2_turn.connect_four == @board.player_2
      return (print "Draw. No winner!") if @player_2_turn.connect_four == :stalemate
  end

  def game_start_setup
    main_menu
    set_player_turns
    @board.print_layout
  end

  def game_sequence
    loop do
      game_logic
      break if @player_1_turn.connect_four == @board.player_1 || @player_2_turn.connect_four == @board.player_2 || @player_2_turn.connect_four == :stalemate
    end
  end

  def game_reset
    @turn_count = 1
    @board = Board.new
  end

  def start
    loop do
      game_start_setup
      game_sequence
      game_reset
    end
  end
end

