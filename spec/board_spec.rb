require 'spec_helper'
require 'tic-tac-toe/board.rb'
require 'tic-tac-toe/cell.rb'

describe TicTacToe::Board do

  let(:board) { described_class.new }
  let(:cell) {described_class.new}

  it 'contain 3 rows in matrix' do
    expect(board.matrix).not_to be_empty
    expect(board.matrix).to be_instance_of(Array)
  end

  it 'makes three things in each row' do
    #board.matrix
    board.matrix.each do |row|
      expect(row).to be_instance_of(Array)
    end
  end
=begin
  xit 'has a cell in the matrix' do
    RSpec::Matchers.define :be_on_board do |board|
      match do |cell|
        cell.on_board?(board)
      end

      failure_message do |cell|
        # generate and return the appropriate string.
      end

      failure_message_when_negated do |cell|
        # generate and return the appropriate string.
      end

      description do
        # generate and return the appropriate string.
      end
    end

    expect(cell(1)).to be_on_board(1)
  end
=end

  end


