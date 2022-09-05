class Game 
  attr_reader :player_1,
              :player_2,
              :board,
              :bot_choices

  def initialize
    @player_1 = ""
    @player_2 = ""
    @board = Board.new
    @is_bot = false
    @bot_choices = ["A", "B", "C", "D", "E", "F", "G"]
    @player_1_turn = ""
    @player_2_turn = ""
  end

  def user_input
    gets.chomp
  end

  def set_player1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @board.player_1 = user_input
      @player_1 = @board.player_1
      @player1 != "" ? break : (print "\nSorry. Please try again.")
    end
  end

  #Reuse above for setting player2 

  def is_bot?
    @is_bot
  end

  def set_bot
    @is_bot = true
    @player_2 = "Computer"
  end

  def bot_selection
    @bot_choices = @bot_choices.shuffle
    @bot_choices[0]
  end

  def welcome_message
    "\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n"
  end

  def main_menu_user_input
    choice = user_input
    if choice == "p"
      set_player1
      set_bot
    elsif choice == "q"
      abort ":("
    else
      print "\nSorry, please try again.\n"
    end
  end

  # a = ("a" if foo) || ("b" if bar) || "c"

  # if foo 'a' elsif bar 'b' else 'c' syntax to help me refactor later -Mostafa

  def main_menu
    print welcome_message
    main_menu_user_input
  end

  # def main_menu_loop
  #   loop do
  #     main_menu
  #   end
  # end

  def player_turns
    @player_1_turn = Turn.new(@player_1, @board) 
    @player_2_turn = Turn.new(@player_2, @board)
    @board.player_2 = "Computer"
  end
  
  def game_sequence
    loop do
      @board.print_layout
      player_1_selection = user_input
      @player_1_turn.column_select(player_1_selection)
      @board.update_layout
      @board.print_layout
      if @player_1_turn.connect_four == @board.player_1
        print "\n #{@board.player_1} wins!"
        break
      end
      computer_selection = bot_selection
      @player_2_turn.column_select(computer_selection)
      board.update_layout
      if @player_2_turn.connect_four == @board.player_2
        print "\n #{@board.player_2} wins!"
        break
      end
    end
  end


  #Switch player number/name references to @board ones
  #Disable player parameter in Turn?
  #Need to Restrict options in column select through loop
  #Need to make column selection not case sensitive



  def start
    main_menu
    player_turns
    game_sequence
  end


  # def choose_opponent_prompt
  #   "\nType 'Computer' to play against computer or 'Player' to play against another player\n"
  # end
  #^there due to limitation on testing methods with user input.

end
