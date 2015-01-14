require 'spec_helper'
require 'tic-tac-toe/board.rb'

describe TicTacToe::Board do

  let(:board) { described_class.new }

  xit 'contain 3 rows in matrix' do
    expect(board.matrix).to include([[]])
  end

  it 'makes three things in each row' do
    #board.matrix.each do |row|
      #expect(row).to include([])
    #end
  end




  end


