class Game 
  attr_reader :player_1,
              :player_2,
              :board,
              :column_choices

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
    gets.chomp.upcase
  end

  def set_player1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @board.player_1 = user_input
      @board.player_1 != "" ? break : (print "\nSorry. Please try again.")
    end
  end

  #Reuse above for setting player2 

  def is_bot?
    @is_bot
  end

  def set_bot
    @is_bot = true
    @board.player_2 = "Computer"
  end

  def bot_selection
    @turn_count += 1
    @column_choices = @column_choices.shuffle
    @column_choices[0]
  end

  def welcome_message
    "\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n"
  end

  def main_menu_user_input
    choice = user_input
    if choice == "p"
      set_player1
      set_bot
      "p"
    elsif choice == "q"
      abort ":("
    else
      print "\nSorry, please try again.\n"
    end
  end

  def main_menu
    print welcome_message
    loop do
      break if main_menu_user_input == "p"
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
      break if @column_choices.include?(@player_1_selection) == true
    end
  end

  def player_1_turn_sequence
    player_1_selection_loop
    @player_1_turn.column_select(@player_1_selection)
    @turn_count += 1
    @board.update_layout
    @board.print_layout
  end

  def bot_turn_sequence
      print "\nTurn #{@turn_count} - Computer turn:"
      computer_selection = bot_selection
      @player_2_turn.column_select(computer_selection)
      board.update_layout
      @board.print_layout
  end
  
  def game_logic
      player_1_turn_sequence
      return (print "\n#{@board.player_1} wins!\n") if @player_1_turn.connect_four == @board.player_1
      bot_turn_sequence
      return (print "\n#{@board.player_2} wins!\n") if @player_2_turn.connect_four == @board.player_2
  end

  def game_start_setup
    main_menu
    set_player_turns
    @board.print_layout
  end

  def game_sequence
    loop do
      game_logic
      break if @player_1_turn.connect_four == @board.player_1 || @player_2_turn.connect_four == @board.player_2
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


  # def choose_opponent_prompt
  #   "\nType 'Computer' to play against computer or 'Player' to play against another player\n"
  # end
  #^there due to limitation on testing methods with user input.

end


#Need to make column selection not case sensitive - incomplete
#Need to make bot play again if selected full column - incomplete
#Need to add draw condition and print


  #Syntax reminder for Mostafa: a = ("a" if foo) || ("b" if bar) || "c"

  # if foo 'a' elsif bar 'b' else 'c' syntax to help me refactor later -Mostafa
