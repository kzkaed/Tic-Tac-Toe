require 'spec_helper'
require 'tic-tac-toe/game'

describe TicTacToe::Game do

  let(:game) { described_class.new }

  it 'has a matrix of 3 rows of 3 items' do

    expect(game.board).to eq([["1", "2", "3"],
                              ["4", "5", "6"],
                              ["7", "8", "9"]])
  end
end