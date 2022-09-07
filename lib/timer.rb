class Timer
    attr_reader :t1,
                :t2,
                :player1_stats,
                :player2_stats

    def initialize
        @player1_stats = {:player_name => "", :wins => 0, win_times_seconds: []}
        @player2_stats = {:player_name => "", :wins => 0, win_times_seconds: []}
    end

    def time_start
       @t1 = Time.now.to_i
    end

    def record_win(player)
       player = player
       if (@player1_stats[:player_name] == "" || @player1_stats[:player_name].upcase == player.upcase) && player != "Computer"           
                @t2 = Time.now.to_i
                @player1_stats[:player_name] = "#{player}"
                @player1_stats[:wins] += 1
                @player1_stats[:win_times_seconds].push(@t2 - @t1) 
        elsif (@player2_stats[:player_name] == "" || @player2_stats[:player_name].upcase == player.upcase) && player != "Computer"
                @t2 = Time.now.to_i
                @player2_stats[:player_name] = "#{player}"
                @player2_stats[:wins] += 1
                @player2_stats[:win_times_seconds].push(@t2 - @t1)
        :no_record
        end            
    end

    def print_player1_stats
        "\nPlayer: #{player1_stats[:player_name]}\nNumber of wins: #{player1_stats[:wins]}\nFastest win (seconds): #{fastest_win(player1_stats[:player_name])}"
    end

    def print_player2_stats
        "\nPlayer: #{player2_stats[:player_name]}\nNumber of wins: #{player2_stats[:wins]}\nFastest win (seconds): #{fastest_win(player2_stats[:player_name])}"
    end

    def fastest_win(player)
        if (player == @player1_stats[:player_name])
            @player1_stats[:win_times_seconds].min
        elsif (player == @player2_stats[:player_name])
            @player2_stats[:win_times_seconds].min
        end
    end
end