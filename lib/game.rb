class Game 
  attr_reader :turn,
              :player


  def initialize
    @player1 = ""
    @player2 = ""
  end

  def bot
  end


  def main_menu_message
    "\nWelcome to CONNECT FOUR\nEnter p to play. Enter q to quit.\n"
  end

  #^there due to limitation on testing methods with user input.

  def main_menu
    print main_menu_message
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
      if @player1 != ""
        break
      end
    end
  end



  # def choose_opponent_prompt
  #   "\nType 'Computer' to play against computer or 'Player' to play against another player\n"
  # end

  def set_player1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @player1 = gets.chomp
      if @player1 != ""    #note to self test one line
        break
      else 
        print "\nSorry. Please try again."
      end
    end
  end

  # def set_player2
  # print "\nPlayer 1, please enter your name.\n"
  # @player2 = gets.chomp
  # end
  

  def start
    main_menu_loop
    turn = Turn.new(user_input,player1, player2)
  end

end