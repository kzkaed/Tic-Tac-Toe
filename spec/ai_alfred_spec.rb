require 'spec_helper'
require 'tic-tac-toe/ai_alfred'
require 'tic-tac-toe/game'

describe TicTacToe::AI_Alfred do

  let(:ai_alfred) { described_class.new }
  let(:game) { TicTacToe::Game.new }

  it 'get best move' do
    allow(game).to receive(:moves).and_return(["1"])
    allow(game).to receive(:board).and_return([["x", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]])
    allow(game).to receive(:available_moves).and_return(["2", "3", "4", "5", "6", "7", "8", "9"])

    expect(ai_alfred.get_best_move(game,'o')).to eq("9")
  end

  it 'get best move cells filled' do
    allow(game).to receive(:available_moves).and_return(["2", "3", "4", "5", "6", "7", "8"])
    expect(ai_alfred.get_best_move(game,'o')).to eq("8")
  end

  it 'get best move cells filled' do
    allow(game).to receive(:available_moves).and_return(["2", "3", "4", "5", "6", "7"])
    expect(ai_alfred.get_best_move(game,'o')).to eq("7")
  end
end