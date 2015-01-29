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

  it 'returns value -1' do
    allow(game).to receive(:winner?).and_return(true)
    expect(ai_minimax.value(game,0)).to eq(-1)
  end

  it 'returns value 0' do
    allow(game).to receive(:draw?).and_return(true)
    expect(ai_minimax.value(game,0)).to eq(0)
  end

  it 'returns value 1' do
    allow(game).to receive(:winner?).and_return(true)
    expect(ai_minimax.value(game,0)).to eq(-1)
  end

  context 'returns move or score based on max score'
  it 'sort out last best move from selection of scores' do
    scores = {"1" => 1, "2" => 1, "7" => 1, "8" => 1}
    expect(ai_minimax.max_sort_move(scores)).to eq("8")
  end

  it 'sorts a max score via sorted scores' do
    scores = {"1" => -1, "2" => 1, "3" => -1, "4" => 1, "5" => 0, "6" => 1, "7" => -1, "8" => 1}
    expect(ai_minimax.max_sort_score(scores)).to eq(1)
  end



  describe 'moves from end of game' do

    it 'return correct last move' do
      game.board = [["x", "o", "x"],
                    ["x", "o", "6"],
                    ["o", "x", "o"]]
      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("6") #has to be this move
    end

    it 'return correct 2nd last move' do
      game.board = [["x", "o", "x"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("9") #draw- move are equal
    end

    it 'o returns correct 3rd last move a block' do
      game.board = [["x", "2", "x"],
                    ["x", "o", "6"],
                    ["o", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("2") #correct block
    end

  end

  describe 'moves from beginning of game' do

    it 'return move 1 of o' do
      game.board = [["x", "2", "3"],
                    ["4", "5", "6"],
                    ["7", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("5")#odd numbers
    end

    it 'return move 2 of o' do
      game.board = [["x", "2", "3"],
                    ["x", "o", "6"],
                    ["7", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("7")#odd numbers
    end

    it 'return move 3 of o' do
      game.board = [["x", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("9")#odd numbers
    end

    it 'return move 4 of o' do
      game.board = [["x", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "8", "o"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("8")#win
    end

    it 'return move 5 of o' do
      game.board = [["x", "2", "x"],
                    ["x", "o", "6"],
                    ["o", "o", "o"]]
      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq(-1)#game.end? with win
    end

    it 'return 3 when no other other option' do
      game.board = [["o", "x", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("3")#game.end? with win
    end

    it 'return 3 with 3 options x turn' do
      game.board = [["o", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("3")#game.end? with win
    end

    #isolate this test
    it 'return 3 with 2 options o turn' do
      game.board = [["1", "2", "3"],
                    ["4", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq("3")#game.end? with win
    end






  end


end