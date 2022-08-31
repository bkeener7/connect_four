require 'rspec'
require './lib/row'
require './lib/column'
require'./lib/board'
require 'pry'


RSpec.describe Board do

    it "1. exists" do

        board = Board.new
        expect(board).to be_an_instance_of(Board)

    end

    it "2. has readable array attribute 'columns'" do

        board = Board.new
        expect(board.columns).to eq([])
    end

    it "3. generates 7 columns with 6 rows each" do

        board = Board.new

        expect(board.columns).to eq([])

        board.generate_columns

        expect(board.columns.length).to eq(7)
        expect(board.columns[0]).to be_an_instance_of(Column)
        expect(board.columns[6]).to be_an_instance_of(Column)
        expect(board.columns.length).to eq(7)
        expect(board.columns[0].rows.length).to eq(6)
        expect(board.columns[0]).to be_an_instance_of(Column)
        expect(board.columns[0].rows[0]).to be_an_instance_of(Row)
        expect(board.columns[6]).to be_an_instance_of(Column)
        expect(board.columns[6].rows[5]).to be_an_instance_of(Row)

    end
    
end
