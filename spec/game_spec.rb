require 'spec_helper'
require 'tic-tac-toe/game'

describe TicTacToe::Game do

  let(:game) { described_class.new }

  it 'should be true' do

    expect(game.run).to eq(true)
  end
end