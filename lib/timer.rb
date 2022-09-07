class Timer
    attr_reader :t1, :t2, :player_stats, :records
    def initialize
        @player_stats = {"player_name" => "", "wins" => 0, "win_times_seconds" => []}
        @records = []
    end

    def time_start
       @t1 = Time.now.to_i
    end

    def record_win(player)
      @t2 = Time.now.to_i
      @player_stats["player_name"] = player
      @player_stats["wins"] += 1
      @player_stats["win_times_seconds"].push(@t2 - @t1) 
      :no_record
    end

    def save_record
      # require 'pry'; binding.pry
      File.write("player_statistics.json", "\n", mode: "a")
      File.write("player_statistics.json", @player_stats.to_json, mode: "a")
    end

    def fetch_records
      record_file = File.open("player_statistics.json")
      record_file_data = record_file.readlines.map(&:chomp)
      record_file.close
      record_file_data.each do |individual_record|
        @records << JSON.parse(individual_record)
      end
    end

    def find_record(player)
      fetch_records
      @records.find do |record|
        record["player_name"] == (player)
      end
    end

    def update_record(player)
      record = find_record(player)
      if record != nil
        @player_stats = record
      else
        @player_stats = {"player_name" => "", "wins" => 0, "win_times_seconds" => []}
      end
    end

    def print_stats(player)
      update_record(player)
      if @player_stats != {"player_name" => "", "wins" => 0, "win_times_seconds": []}
        print "\nPlayer: #{@player_stats["player_name"]}\nNumber of wins: #{@player_stats["wins"]}\nFastest win (seconds): #{@player_stats["win_times_seconds"]}"
      else
        print "\nWin a game to start gathering stats!"
      end
  end
end