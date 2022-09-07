class Timer
    attr_reader :t1, :t2, :player_stats

    def initialize
        @player_stats = {:player_name => "", :wins => 0, win_times: []}
    end

    def time_start
       @t1 = Time.now.to_i
    end

    def record_win(player)
       player = player
       if player != "Computer"            
            @t2 = Time.now.to_i
            @player_stats[:player_name] = "#{player}"
            @player_stats[:wins]+1
            @player_stats[:win_times].push(@t2 - @t1) 
        end
        @t1 = 0
        @t2 = 0
    end
end