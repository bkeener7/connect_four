require 'rspec'
require './lib/row'
require './lib/column'
require './lib/board'
require './lib/turn'
require 'pry'

RSpec.describe Turn do

    it '1. exists' do

        turn = Turn.new
        expect(turn).to be_an_instance_of(Turn)

    end

    it '2. has a player select a column and coverts it to array value' do
   
        turn = Turn.new
        
        expect(turn.column_select('A', 'Mostafa')).to eq([0, 'Mostafa'])
        expect(turn.column_select('E', 'Bryan')).to eq([5, 'Bryan'])

    end

    it '3. it can fill a piece on the board from user input' do

        turn = Turn.new
        board = Board.new('Bryan', 'Mostafa')
        board.generate_columns
        turn.column_select('A', 'Bryan')
        expect(board.columns[0].rows[5].playable).to eq(true)
        expect(board.columns[0].rows[5].player).to eq('')
        board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        expect(board.columns[0].rows[5].playable).to eq(false)
        expect(board.columns[0].rows[5].player).to eq('Bryan')
        expect(board.columns[0].rows[4].playable).to eq(true)

    end

    it '4. it accurately toggles which rows are playable' do

        turn = Turn.new
        board = Board.new('Bryan', 'Mostafa')
        board.generate_columns
        turn.column_select('A', 'Bryan')
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
        
        turn = Turn.new
        board = Board.new('Bryan', 'Mostafa')
        board.generate_columns
        turn.column_select('A', 'Bryan')

        6.times do
            board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        end

        expect(board.columns[0].rows[0].playable).to eq(false)
        expect(board.columns[0].rows[0].player).to eq('Bryan')
        
        #invalid player move here
        expect(board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])).to eq(puts 'That is an invalid move.')
    end

    xit '6. checks vertically for win conditions' do

        turn = Turn.new
        board = Board.new('Bryan', 'Mostafa')
        board.generate_columns
        turn.column_select('A', 'Bryan')

        4.times do
            board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
        end

        expect(turn.column_win).to eq(true)
        expect(turn.winner).to eq('Bryan')

    end
    



end