require 'rspec'
require './lib/row'
require './lib/column'
require'./lib/board'
require 'pry'

RSpec.describe Board do

  it "1. exists" do
    board = Board.new("Megan", "Hod")

    expect(board).to be_an_instance_of(Board)
  end

  it "2. has 2 players which are dynamic attributes" do
    board = Board.new("Megan", "Hod")

    expect(board.player_1).to eq("Megan")
    expect(board.player_2).to eq("Hod")
  end

  it "3. has a readable array attribute composed of 7 column instances with 6 row instances each" do
    board = Board.new("Megan", "Hod")

    expect(board.columns.length).to eq(7)
    expect(board.columns[0]).to be_an_instance_of(Column)
    expect(board.columns[6]).to be_an_instance_of(Column)
    expect(board.columns[0].rows.length).to eq(6)
    expect(board.columns[0].rows[0]).to be_an_instance_of(Row)
    expect(board.columns[6].rows[5]).to be_an_instance_of(Row)
  end

  it "4. has a column index attribute with a default value of 0" do
    board = Board.new("Megan", "Hod")

    expect(board.column_index).to eq(0)
  end

  it "5. has a row index attribute with a default value of 0" do
    board = Board.new("Megan", "Hod")

    expect(board.row_index).to eq(0)
  end

  it "6. has a layout index for the string with a default value of 16" do
    board = Board.new("Megan", "Hod")

    expect(board.layout_index).to eq(16)
  end

  it ".7 prints out a board of 7 columns, A through G, and 6 rows." do
      board = Board.new("Megan", "Hod")

      expect(board.print_layout).to eq(print "\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")
  end

  it ".8 changes dots on the board to 'x' for player 1 or 'o' for player 2" do
      board = Board.new("Megan", "Hod")
      expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")
      
      3.times do
        board.columns[0].play_piece("Megan")
      end
      board.update_layout
      expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\n\n")
      expect(board.print_layout).to eq(print "\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\n\n")

      6.times do
        board.columns[6].play_piece("Hod")
      end
      board.update_layout
      expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . o\n. . . . . . o\n. . . . . . o\nx . . . . . o\nx . . . . . o\nx . . . . . o\n\n")
      expect(board.print_layout).to eq(print "\n\nA B C D E F G\n. . . . . . o\n. . . . . . o\n. . . . . . o\nx . . . . . o\nx . . . . . o\nx . . . . . o\n\n")
  end
end

#binding.pry
