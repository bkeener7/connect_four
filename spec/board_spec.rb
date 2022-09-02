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

    it ". prints out a board of 7 columns, A through G, and 6 rows." do
        board = Board.new("Megan", "Hod")

        expect(board.columns.length).to eq(7)
        expect(board.columns[0].rows.length).to eq(6)
        expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")
				expect(board.layout_print).to eq(print "\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")
    end



    it ". changes dots on the board to 'x' for player 1 or 'o' for player 2" do
        board = Board.new("Megan", "Hod")
  
        expect(board.columns.length).to eq(7)
        expect(board.columns[0].rows.length).to eq(6)
        expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n\n")

        board.columns[0].play_piece("Megan")
        expect(board.columns[0].rows[5].player).to eq("Megan")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\nx . . . . . .\n\n")

        board.columns[0].play_piece("Megan")
        expect(board.columns[0].rows[5].player).to eq("Megan")
        expect(board.columns[0].rows[4].player).to eq("Megan")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\n. . . . . . .\nx . . . . . .\nx . . . . . .\n\n")

        board.columns[0].play_piece("Megan")
        expect(board.columns[0].rows[5].player).to eq("Megan")
        expect(board.columns[0].rows[4].player).to eq("Megan")
        expect(board.columns[0].rows[3].player).to eq("Megan")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\n. . . . . . .\n. . . . . . .\n. . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\n\n")

        board.columns[0].play_piece("Megan")
        board.columns[0].play_piece("Megan")
        board.columns[0].play_piece("Megan")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\n\n")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\n\n")


        board.columns[6].play_piece("Hod")
        expect(board.columns[6].rows[5].player).to eq("Hod")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . .\nx . . . . . o\n\n")

        board.columns[6].play_piece("Hod")
        board.columns[6].play_piece("Hod")
        board.columns[6].play_piece("Hod")
        board.columns[6].play_piece("Hod")
        expect(board.columns[6].rows[4].player).to eq("Hod")
        expect(board.columns[6].rows[3].player).to eq("Hod")
        expect(board.columns[6].rows[2].player).to eq("Hod")
        expect(board.columns[6].rows[1].player).to eq("Hod")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\nx . . . . . .\nx . . . . . o\nx . . . . . o\nx . . . . . o\nx . . . . . o\nx . . . . . o\n\n")

        board.columns[3].play_piece("Megan")
        board.columns[4].play_piece("Hod")

        board.update_layout
        expect(board.layout).to eq("\n\nA B C D E F G\nx . . . . . .\nx . . . . . o\nx . . . . . o\nx . . . . . o\nx . . . . . o\nx . . x o . o\n\n")
    end


end

#binding.pry
