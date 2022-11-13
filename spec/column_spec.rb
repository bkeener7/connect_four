require 'rspec'
require './lib/row'
require './lib/column'

RSpec.describe Column do
  it '1. exists' do
    column = Column.new
    expect(column).to be_an_instance_of(Column)
  end

  it '2. has array attribute rows with 6 instances of the row class' do
    column = Column.new
    expect(column.rows.length).to eq(6)
    expect(column.rows[0]).to be_an_instance_of(Row)
    expect(column.rows[5]).to be_an_instance_of(Row)
  end

  it '3. fills the next available row with current players piece' do
    column = Column.new
    expect(column.rows[5].playable).to eq(true)
    expect(column.rows[5].player).to eq('')

    column.play_piece('Bryan')
    expect(column.rows[5].playable).to eq(false)
    expect(column.rows[5].player).to eq('Bryan')
    expect(column.rows[4].playable).to eq(true)
    expect(column.rows[4].player).to eq('')
    column.play_piece('Bryan')
    expect(column.rows[4].playable).to eq(false)
    expect(column.rows[4].player).to eq('Bryan')
  end

  it '4. only plays in valid spaces and returns an error if an invalid move is attempted' do
    column = Column.new

    expect(column.rows[5].playable).to eq(true)
    expect(column.rows[4].playable).to eq(false)
    column.play_piece('Bryan')
    expect(column.rows[5].playable).to eq(false)
    expect(column.rows[4].playable).to eq(true)
    column.play_piece('Bryan')
    expect(column.rows[5].playable).to eq(false)
    expect(column.rows[4].playable).to eq(false)
    expect(column.rows[3].playable).to eq(true)

    4.times do
      column.play_piece('Bryan')
    end

    expect(column.rows[5].playable).to eq(false)
    expect(column.rows[4].playable).to eq(false)
    expect(column.rows[3].playable).to eq(false)
    expect(column.rows[2].playable).to eq(false)
    expect(column.rows[1].playable).to eq(false)
    expect(column.rows[0].playable).to eq(false)
    # This is the end of valid playing options for this column. Next attempt for a move
    # here should result in an error
    expect(column.count).to eq(0)
    expect(column.play_piece('Bryan')).to eq(:invalid_move)
  end

  it '5. adds player name to row when playing piece' do
    column = Column.new
    expect(column.rows[5].player).to eq('')

    column.play_piece('Bryan')
    expect(column.rows[5].player).to eq('Bryan')
    expect(column.rows[4].player).to eq('')

    column.play_piece('Mostafa')
    expect(column.rows[4].player).to eq('Mostafa')
  end
end
