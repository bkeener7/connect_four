class Game
  attr_reader :player_1,
              :player_2,
              :board,
              :column_choices,
              :turn_count,
              :timer

  def initialize
    @board = Board.new
    @is_bot = false
    @column_choices = %w[A B C D E F G]
    @player_1_turn = ''
    @player_2_turn = ''
    @player_1_selection = ''
    @turn_count = 1
    @timer = Timer.new
  end

  def user_input
    input = gets.chomp
    abort if input.upcase == 'QUIT'
    input
  end

  def choose_opponent_prompt
    "\nType 'C' to play against computer or 'P' to play against another player.\n"
  end

  def gets_stats(stat_request)
    if stat_request.upcase == @timer.player1_stats[:player_name].upcase
      @timer.print_player1_stats
    elsif stat_request.upcase == @timer.player2_stats[:player_name].upcase
      @timer.print_player2_stats
    else
      print "\nWin a game to start gathering stats!"
    end
  end

  def choose_opponent
    opponent_choice = user_input
    case opponent_choice.upcase
    when 'C'
      set_bot
    when 'P'
      set_player_2
    else
      print "\nInvalid selection.\n"
    end
  end

  def set_players
    set_player_1
    loop do
      print choose_opponent_prompt
      choose_opponent
      break if @board.player_2 != ''
    end
  end

  def set_player_1
    loop do
      print "\nPlayer 1, please enter your name.\n"
      @board.player_1 = user_input
      print "\nHi #{@board.player_1}! Press 'S' to see stats or press any other key to continue.\n"
      puts gets_stats(@board.player_1) if user_input.upcase == 'S'
      @board.player_1 != '' ? break : (print "\nSorry. Please try again.")
    end
  end

  def set_player_2
    loop do
      print "\nPlayer 2, please enter your name.\n"
      @board.player_2 = user_input
      print "\nHi #{@board.player_2}! Press 'S' to see stats or press any other key to continue.\n"
      puts gets_stats(@board.player_2) if user_input.upcase == 'S'
      @board.player_2 != '' ? break : (print "\nSorry. Please try again.")
    end
  end

  def is_bot?
    @is_bot
  end

  def set_bot
    @is_bot = true
    @board.player_2 = 'Computer'
  end

  def welcome_message
    "\nWelcome to CONNECT FOUR\nEnter 'P' to play. Enter 'QUIT' to exit at anytime.\n"
  end

  def main_menu_user_input
    choice = user_input
    case choice.upcase
    when 'P'
      set_players
      :continue
    when 'QUIT'
      abort ':('
    else
      print "\nSorry, please try again.\n"
    end
  end

  def main_menu
    print welcome_message
    loop do
      break if main_menu_user_input == :continue
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

  def player_2_selection_loop
    loop do
      print "\nTurn #{@turn_count} - #{@board.player_2}, please Select a column:\n"
      @player_2_selection = user_input
      if @column_choices.include?(@player_2_selection.upcase) == true && @player_2_turn.column_select(@player_2_selection.upcase) != :invalid_move
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

  def player_2_turn_sequence
    player_2_selection_loop
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
    if @player_1_turn.connect_four == @board.player_1
      @timer.record_win(@board.player_1)
      return (print "\n#{@board.player_1} wins!\n")
    end
    bot_turn_sequence if is_bot? == true || player_2_turn_sequence
    if @player_2_turn.connect_four == @board.player_2
      @timer.record_win(@board.player_2)
      return (print "\n#{@board.player_2} wins!\n")
    end
    return (print 'Draw. No winner!') if @player_2_turn.connect_four == :stalemate
  end

  def game_start_setup
    main_menu
    set_player_turns
    @board.print_layout
  end

  def game_sequence
    loop do
      game_logic
      if @player_1_turn.connect_four == @board.player_1 || @player_2_turn.connect_four == @board.player_2 || @player_2_turn.connect_four == :stalemate
        break
      end
    end
  end

  def game_reset
    @turn_count = 1
    @board = Board.new
    @is_bot = false
  end

  def start
    loop do
      game_start_setup
      @timer.time_start
      game_sequence
      game_reset
    end
  end
end
