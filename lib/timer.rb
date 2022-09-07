class Timer
    attr_reader :t1, :t2, :player1_stats, :player2_stats, :board

    def initialize(board)
        @t1 = 0
        @t2 = 0
        @board = board
        @player_stats = {:wins => 0, win_times: []}
    end

    def time_start
       @t1 = Time.now.to_i
    end

    def record_win(player)
        @t2 = Time.now.to_i
        @(player)_stats[:wins]+1
        @(player)_stats[:win_times].push(@t2 - @t1)     
    end

end