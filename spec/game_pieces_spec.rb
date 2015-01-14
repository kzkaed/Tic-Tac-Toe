require 'spec_helper'
require 'tic-tac-toe/game_pieces.rb'

describe TicTacToe::GamePieces do

  let(:game_pieces) { described_class.new }
  it 'should have an X, O and an Empty' do

    expect(game_pieces.x).to eq('x')
    expect(game_pieces.o).to eq('o')
    expect(game_pieces.empty).to eq(' ')
  end
end