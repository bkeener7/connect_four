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
  end

  def set_player1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @player1 = gets.chomp
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
  #^there due to limitation on testing methods with user input.

  def main_menu
    print welcome_message
    main_menu_user_input
  end

  def main_menu_user_input
    if gets.chomp == "q"
      abort ":("
    elsif gets.chomp == "p"
      set_player1
    else
      print "\nSorry, please try again.\n"
    end
  end

  def main_menu_loop
    loop do
      main_menu
    end
  end


  def start
    main_menu_loop
    player_1_turn = Turn.new(@player_1, @board)
    player_2_turn = Turn.new(@player_2, @board)
  end


  # def choose_opponent_prompt
  #   "\nType 'Computer' to play against computer or 'Player' to play against another player\n"
  # end
  #^there due to limitation on testing methods with user input.

end