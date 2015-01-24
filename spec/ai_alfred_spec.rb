require 'spec_helper'
require 'tic-tac-toe/ai_alfred'

describe TicTacToe::AI_Alfred do

  let(:ai_alfred) {described_class.new}

  it 'get best move' do

    game = TicTacToe::Game.new
    allow(game).to receive(:moves).and_return(["1"])
    expect(ai_alfred.get_best_move(game)).to eq("9")


  end

  it 'get best move cells filled' do

    game = TicTacToe::Game.new
    allow(game).to receive(:moves).and_return(["1","9","4"])
    expect(ai_alfred.get_best_move(game)).to eq("8")


  end

  it 'get best move cells filled' do

    game = TicTacToe::Game.new
    allow(game).to receive(:moves).and_return(["1","9","4","8"])
    expect(ai_alfred.get_best_move(game)).to eq("7")


  end


end