class Column
  attr_reader :rows,
              :count

  def initialize
    @rows = []
    @count = 5
    generate_rows
  end

  def generate_rows
    6.times do
      rows << Row.new
    end
    rows[5].toggle_playable
  end

  def play_piece(player)
    if count.positive? && rows[count].playable == true
      rows[count].toggle_player(player)
      rows[count - 1].toggle_playable
      @count -= 1
    elsif count.zero? && rows[count].playable == true
      rows[count].toggle_player(player)
    else
      :invalid_move
    end
  end
end
