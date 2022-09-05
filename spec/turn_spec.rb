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

    turn.column_select('A')
    expect(turn.user_selection).to eq([0, 'Bryan'])
    turn.column_select('E')
    expect(turn.user_selection).to eq([4, 'Bryan'])

  end

  it '3. it can fill a piece on the board from user input' do
    board = Board.new
    turn = Turn.new('Bryan', board)

    expect(board.columns[0].rows[5].playable).to eq(true)
    expect(board.columns[0].rows[5].player).to eq('')
    turn.column_select('A')

    #board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
    expect(board.columns[0].rows[5].playable).to eq(false)
    expect(board.columns[0].rows[5].player).to eq('Bryan')
    expect(board.columns[0].rows[4].playable).to eq(true)

  end

  xit '4. it accurately toggles which rows are playable' do
    board = Board.new
    turn = Turn.new('Bryan', board)

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

  xit '5. does not allow an invalid player move' do        
    board = Board.new
    turn = Turn.new('Bryan', board)
    turn.column_select('A')

    6.times do
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
    end

    expect(board.columns[0].rows[0].playable).to eq(false)
    expect(board.columns[0].rows[0].player).to eq('Bryan')
      
    #invalid player move here
    expect(board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])).to eq(puts 'That is an invalid move.')

  end 

  xit '6. checks first column for vertical win' do
    board = Board.new
    turn = Turn.new('Bryan', board)

    turn.column_select('A')
    4.times do
      board.columns[turn.user_selection[0]].play_piece(turn.user_selection[1])
    end

    expect(turn.column_win).to eq('Bryan')
    expect(turn.connect_four).to eq('Bryan')

  end

  xit '7. checks other columns for vertical wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)
    
    turn1.column_select('D')    
    2.times do
      board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    end

    turn2.column_select('D')
    4.times do
      board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    end
    
    expect(turn1.column_win).to eq('Mostafa')
    expect(turn2.column_win).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  xit '8. does not give false positives for vertical wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])

    expect(turn1.column_win).to eq(:no_win)
    expect(turn2.column_win).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)

  end

  xit '9. checks first row for horizontal win' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('C')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
  
    expect(turn1.row_win).to eq('Mostafa')
    expect(turn2.row_win).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  xit '10. checks other rows for horizontal win' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    #row 1
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])

    #row 2
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])

    #row 3 - winning row
    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn1.column_select('E')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn1.column_select('F')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])

    expect(turn1.row_win).to eq('Bryan')
    expect(turn2.row_win).to eq('Bryan')
    expect(turn1.connect_four).to eq('Bryan')

  end

  xit '11. does not return false positives for horizontal wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    #row 1
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])

    #row 2
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])

    #row 3 - winning row
    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('C')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('E')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn1.column_select('F')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])

    expect(turn1.row_win).to eq(:no_win)
    expect(turn2.row_win).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)

  end

  xit '12. checks right and up diagonal wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn1.column_select('C')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('E')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('F')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    
    #win condition is in arr4, or right_up[4]    

    expect(turn1.diagonal_rightup).to eq('Bryan')
    expect(turn1.diagonal_leftup).to eq(:no_win)
    expect(turn1.connect_four).to eq('Bryan')

  end

  xit '13. checks left and up diagonal wins' do
    board = Board.new
    turn1 = Turn.new('Mostafa', board)
    turn2 = Turn.new('Bryan', board)

    turn1.column_select('G')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('F')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('F')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('E')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('E')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn2.column_select('D')
    board.columns[turn2.user_selection[0]].play_piece(turn2.user_selection[1])
    turn1.column_select('D')
    board.columns[turn1.user_selection[0]].play_piece(turn1.user_selection[1])

    expect(turn1.diagonal_rightup).to eq(:no_win)
    expect(turn1.diagonal_leftup).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  xit '14. does not confuse empty spaces for players' do
    board = Board.new
    turn1 = Turn.new('Mostafa', board)
    turn2 = Turn.new('Bryan', board)

    expect(turn1.column_win).to eq(:no_win)
    expect(turn1.row_win).to eq(:no_win)
    expect(turn1.diagonal_rightup).to eq(:no_win)
    expect(turn1.diagonal_leftup).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)    

  end
    
end