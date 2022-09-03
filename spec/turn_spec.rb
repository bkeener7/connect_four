require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/turn'
require 'pry'

RSpec.describe Turn do

    it '1. exists' do

      board = Board.new
      turn = Turn.new('Bryan', board)

    end

    it '2. has a player select a column and coverts it to array value' do
   
      board = Board.new
      turn = Turn.new('Bryan', board)
        
        expect(turn.column_select('A')).to eq([0, 'Bryan'])
        expect(turn.column_select('E')).to eq([5, 'Bryan'])

    end

    it '3. it can fill a piece on the board from user input' do

      board = Board.new
      turn = Turn.new('Bryan', board)
        # board.generate_columns
        turn.column_select('A')
        expect(board.columns[0].rows[5].playable).to eq(true)
        expect(board.columns[0].rows[5].player).to eq('')
        board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        expect(board.columns[0].rows[5].playable).to eq(false)
        expect(board.columns[0].rows[5].player).to eq('Bryan')
        expect(board.columns[0].rows[4].playable).to eq(true)

    end

    it '4. it accurately toggles which rows are playable' do

      board = Board.new
      turn = Turn.new('Bryan', board)
        #board.generate_columns
        turn.column_select('A')
        expect(board.columns[0].rows[5].playable).to eq(true)
        expect(board.columns[0].rows[5].player).to eq('')

        3.times do
            board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        end

        expect(board.columns[0].rows[5].playable).to eq(false)
        expect(board.columns[0].rows[5].player).to eq('Bryan')    
        expect(board.columns[0].rows[4].playable).to eq(false)
        expect(board.columns[0].rows[4].player).to eq('Bryan')
        expect(board.columns[0].rows[3].playable).to eq(false)
        expect(board.columns[0].rows[3].player).to eq('Bryan')
        expect(board.columns[0].rows[2].playable).to eq(true)
        expect(board.columns[0].rows[2].player).to eq('')

    end

    it '5. does not allow an invalid player move' do
        
      board = Board.new
      turn = Turn.new('Bryan', board)
        #board.generate_columns
        turn.column_select('A')

        6.times do
            board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        end

        expect(board.columns[0].rows[0].playable).to eq(false)
        expect(board.columns[0].rows[0].player).to eq('Bryan')
        
        #invalid player move here
        expect(board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])).to eq(puts 'That is an invalid move.')
    end 

    it '9. checks first column for vertical win' do

      board = Board.new
      turn = Turn.new('Bryan', board)
      #board.generate_columns
  
      turn.column_select('A')
      4.times do
          board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      end
  
      expect(turn.column_win).to eq('Bryan')
  
    end
  
    xit '10. checks other columns for vertical wins' do
      turn = Turn.new
      board = Board.new('Bryan', 'Mostafa')
      #board.generate_columns
  
      turn.column_select('D', 'Bryan')    
      2.times do
        board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      end
  
      turn.column_select('D', 'Mostafa')
      4.times do
        board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      end
  
      expect(board.column_win).to eq('Mostafa')
  
    end
  
    xit '11. does not give false positives for vertical wins' do
      turn = Turn.new
      board = Board.new('Bryan', 'Mostafa')
      #board.generate_columns
  
      turn.column_select('D', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('D', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      expect(board.column_win).to eq(:no_win)
  
    end
  
    xit '12. checks first row for horizontal win' do
      turn = Turn.new
      board = Board.new('Bryan', 'Mostafa')
      #board.generate_columns
  
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      expect(board.row_win).to eq('Mostafa')
  
    end
  
    xit '13. checks other rows for horizontal win' do
      turn = Turn.new
      board = Board.new('Bryan', 'Mostafa')
      #board.generate_columns
  
      #row 1
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      #row 2
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      #row 3 - winning row
      turn.column_select('D', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      expect(board.row_win).to eq('Bryan')
  
    end
  
    xit '14. does not return false positives for horizontal wins' do
  
      turn = Turn.new
      board = Board.new('Bryan', 'Mostafa')
      #board.generate_columns
  
      #row 1
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      #row 2
      turn.column_select('D', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      #row 3 - winning row
      turn.column_select('D', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('C', 'Mostafa')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('E', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
      turn.column_select('F', 'Bryan')
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
  
      expect(board.row_win).to eq(:no_win)
  
    end
    
end