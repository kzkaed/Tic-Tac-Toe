require 'spec_helper'
require 'tic-tac-toe/ai_minimax'
require 'tic-tac-toe/game'

describe TicTacToe::AI_Minimax do

  let(:ai_minimax) { described_class.new }
  let(:game) { TicTacToe::Game.new }

  it 'set next player' do
    player = 'o'
    expect(ai_minimax.next_player(player)).to eq('x')
  end

  context 'x seed' do
    it 'o best move is 3 to block, 3 options available' do
      game.board = [["x", "o", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'x')).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end

    it 'x best move is 3 to block with 3 options available' do
      game.board = [["o", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'x')).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end

    it 'o best move is 3 with 5 options available' do
      game.board = [["1", "2", "3"],
                    ["4", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'x')).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end
  end

  context 'o seed' do
    it 'o best move is 3 to block with 3 options available' do
      game.board = [["x", "o", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o')).to eq(1) #win
      expect(ai_minimax.best_move).to eq("3")
    end


    it 'x best move is 3 to block with 3 options available' do
      game.board = [["o", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'o')).to eq(1)
      expect(ai_minimax.best_move).to eq("3")
    end
  end

  it 'test change to integer ' do
    allow(game).to receive(:winner).and_return('x')

    expect(ai_minimax.change_to_integer_representation('o', game)).to eq(1)
    expect(ai_minimax.change_to_integer_representation('x', game)).to eq(-1)

    allow(game).to receive(:winner).and_return('o')

    expect(ai_minimax.change_to_integer_representation('o', game)).to eq(-1)
    expect(ai_minimax.change_to_integer_representation('x', game)).to eq(1)
  end

  it 'test value ' do
    allow(game).to receive(:winner?).and_return(true)
    mark = 'x'
    depth = 5
    expect(ai_minimax.value(game, mark, depth)).to eq(-5)
  end

end