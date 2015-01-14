require 'spec_helper'
require 'tic-tac-toe/game'

describe TicTacToe::Game do

  let(:game) { described_class.new }

  it 'has a matrix of 3 rows of 3 items' do

    expect(game.matrix).to eq([
                                  ["-", "-", "-"],
                                  ["-", "-", "-"],
                                  ["-", "-", "-"]
                              ])
  end
end