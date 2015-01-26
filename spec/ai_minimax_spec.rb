require 'spec_helper'
require 'tic-tac-toe/ai_minimax'

describe TicTacToe::AI_Minimax do


let(:ai_minimax) { described_class.new }

  it 'set next player'do
    player = 'o'
    expect(ai_minimax.next_player(player)).to eq('x')
  end


end