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

    expect(board.columns[0].rows[5].playable).to eq(false)
    expect(board.columns[0].rows[5].player).to eq('Bryan')
    expect(board.columns[0].rows[4].playable).to eq(true)

  end

  it '4. it accurately toggles which rows are playable' do
    board = Board.new
    turn = Turn.new('Bryan', board)

    expect(board.columns[0].rows[5].playable).to eq(true)
    expect(board.columns[0].rows[5].player).to eq('')
    

    3.times do
      turn.column_select('A')
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
    
    6.times do
      turn.column_select('A')
    end

    expect(board.columns[0].rows[0].playable).to eq(false)
    expect(board.columns[0].rows[0].player).to eq('Bryan')
      
    #invalid player move here
    expect(turn.column_select('A')).to eq(:invalid_move)

  end 

  it '6. checks first column for vertical win' do
    board = Board.new
    turn = Turn.new('Bryan', board)

    4.times do
      turn.column_select('A')
    end

    expect(turn.column_win).to eq('Bryan')
    expect(turn.connect_four).to eq('Bryan')

  end

  it '7. checks other columns for vertical wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)
    
    2.times do
      turn1.column_select('D') 
    end
    
    4.times do
      turn2.column_select('D')
    end
    
    expect(turn1.column_win).to eq('Mostafa')
    expect(turn2.column_win).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  it '8. does not give false positives for vertical wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn1.column_select('D')    
    turn2.column_select('D')    
    turn1.column_select('D')    
    turn2.column_select('D')  
    turn2.column_select('D')   
    turn2.column_select('D')  
    
    expect(turn1.column_win).to eq(:no_win)
    expect(turn2.column_win).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)

  end

  it '9. checks first row for horizontal win' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn2.column_select('D')
    turn2.column_select('C')
    turn2.column_select('E')
    turn2.column_select('F')
  
    expect(turn1.row_win).to eq('Mostafa')
    expect(turn2.row_win).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  it '10. checks other rows for horizontal win' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    #row 1
    turn2.column_select('D')
    turn1.column_select('C')
    turn2.column_select('E')
    turn2.column_select('F')

    #row 2
    turn2.column_select('D')
    turn1.column_select('C')
    turn2.column_select('E')
    turn2.column_select('F')

    #row 3 - winning row
    turn1.column_select('D')
    turn1.column_select('C')
    turn1.column_select('E')
    turn1.column_select('F')

    expect(turn1.row_win).to eq('Bryan')
    expect(turn2.row_win).to eq('Bryan')
    expect(turn1.connect_four).to eq('Bryan')

  end

  it '11. does not return false positives for horizontal wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    #row 1
    turn2.column_select('D')
    turn1.column_select('C')
    turn2.column_select('E')
    turn2.column_select('F')

    #row 2
    turn2.column_select('D')
    turn1.column_select('C')
    turn2.column_select('E')
    turn2.column_select('F')

    #row 3 - winning row
    turn1.column_select('D')
    turn2.column_select('C')
    turn1.column_select('E')
    turn1.column_select('F')

    expect(turn1.row_win).to eq(:no_win)
    expect(turn2.row_win).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)

  end

  it '12. checks right and up diagonal wins' do
    board = Board.new
    turn1 = Turn.new('Bryan', board)
    turn2 = Turn.new('Mostafa', board)

    turn1.column_select('C')
    turn2.column_select('D')
    turn1.column_select('D')
    turn2.column_select('E')
    turn2.column_select('E')
    turn1.column_select('E')
    turn2.column_select('F')
    turn2.column_select('F')
    turn2.column_select('F')
    turn1.column_select('F')
    
    #win condition is in arr4, or right_up[4]    

    expect(turn1.diagonal_rightup).to eq('Bryan')
    expect(turn1.diagonal_leftup).to eq(:no_win)
    expect(turn1.connect_four).to eq('Bryan')

  end

  it '13. checks left and up diagonal wins' do
    board = Board.new
    turn1 = Turn.new('Mostafa', board)
    turn2 = Turn.new('Bryan', board)

    turn1.column_select('G')
    turn2.column_select('F')
    turn1.column_select('F')
    turn2.column_select('E')
    turn2.column_select('E')
    turn1.column_select('E')
    turn2.column_select('D')
    turn2.column_select('D')
    turn2.column_select('D')
    turn1.column_select('D')

    expect(turn1.diagonal_rightup).to eq(:no_win)
    expect(turn1.diagonal_leftup).to eq('Mostafa')
    expect(turn1.connect_four).to eq('Mostafa')

  end

  it '14. does not confuse empty spaces for players' do
    board = Board.new
    turn1 = Turn.new('Mostafa', board)
    turn2 = Turn.new('Bryan', board)

    expect(turn1.column_win).to eq(:no_win)
    expect(turn1.row_win).to eq(:no_win)
    expect(turn1.diagonal_rightup).to eq(:no_win)
    expect(turn1.diagonal_leftup).to eq(:no_win)
    expect(turn1.connect_four).to eq(:no_win)    

  end

  it '15. returns :stalemate if there are no more available plays' do
    board = Board.new
    turn1 = Turn.new('Mostafa', board)
    turn2 = Turn.new('Bryan', board)

    3.times do
      turn1.column_select('A')
      turn2.column_select('A')

      turn2.column_select('B')
      turn1.column_select('B')

      turn2.column_select('C')
      turn1.column_select('C')

      turn1.column_select('D')
      turn2.column_select('D')

      turn1.column_select('E')
      turn2.column_select('E')

      turn2.column_select('F')
      turn1.column_select('F')

      turn2.column_select('G')
      turn1.column_select('G')
    end

    expect(turn1.column_win).to eq(:no_win)
    expect(turn1.row_win).to eq(:no_win)
    expect(turn1.diagonal_rightup).to eq(:no_win)
    expect(turn1.diagonal_leftup).to eq(:no_win)
    expect(turn1.stalemate_check).to eq(:stalemate)
    expect(turn1.connect_four).to eq(:stalemate)   

  end

  it '16. checks for wins over four pieces long' do
    #this test was created to add an additional check due to an unforeseen 
    #false negatives encountered during later testing 
    board = Board.new
    turn = Turn.new('Mostafa', board)

    6.times do
      turn.column_select('A')
    end

    expect(turn.column_win).to eq('Mostafa')
    expect(turn.connect_four).to eq('Mostafa')

  end
    
end