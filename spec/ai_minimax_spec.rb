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
    expect(ai_minimax.value(game,9)).to eq(-9)
  end

  it 'returns value 0' do
    allow(game).to receive(:draw?).and_return(true)
    expect(ai_minimax.value(game,0)).to eq(0)
  end

  it 'returns value 1' do
    allow(game).to receive(:winner?).and_return(true)
    expect(ai_minimax.value(game,5)).to eq(-5)
  end

  context 'returns move or score based on sort' do
    it 'sort out last best move from selection of scores' do
      scores = {"1"=>6, "2"=>-5, "3"=>8, "4"=>6, "6"=>6}
      expect(ai_minimax.max_move_sort(scores)).to eq("3")
    end

    it 'sorts a max score via sorted scores' do
      scores = {"1"=>0, "2"=>0, "3"=>6}
      expect(ai_minimax.max_score_sort(scores)).to eq(6)
    end
  end

  context 'return move or score based on max by' do
    it 'max by best move from scores' do
      scores = {"2"=>-4, "3"=>0}
      expect(ai_minimax.max_by_move(scores)).to eq("3")
    end

    it 'max by score from scores' do
      scores = {"1"=>-6, "2"=>-6, "3"=>-6, "4"=>-6}
      expect(ai_minimax.max_by_score(scores)).to eq(-6)
    end
  end


  describe 'moves from end of game' do

    it 'return correct last move' do
      game.board = [["x", "o", "x"],
                    ["x", "o", "6"],
                    ["o", "x", "o"]]
      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("6")
    end

    it 'return correct 2nd last move' do
      game.board = [["x", "o", "x"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("6")
    end

    it 'o returns correct 3rd last move a block' do
      game.board = [["x", "2", "x"],
                    ["x", "o", "6"],
                    ["o", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("2") #correct block
    end

  end

  describe 'moves from beginning of game' do

    it 'o first move ' do
      game.board = [["x", "2", "3"],
                    ["4", "5", "6"],
                    ["7", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("7")#odd numbers
    end

    it 'o move 2' do
      game.board = [["x", "2", "3"],
                    ["x", "5", "6"],
                    ["o", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("2")#odd numbers
    end

    it 'o move 3 ' do
      game.board = [["x", "o", "3"],
                    ["x", "x", "6"],
                    ["o", "8", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("9")#odd numbers
    end

    #isolate
    it 'return move 4 of o' do
      game.board = [["x", "o", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("3")#win
    end

    it 'return move 5 of o' do
      game.board = [["x", "2", "x"],
                    ["x", "o", "6"],
                    ["o", "o", "o"]]
      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq(-9)#game.end? with win
    end

    it 'return 3 when no other other option' do
      game.board = [["o", "x", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("3")#game.end? with win
    end

    it 'return 3 with 3 options x turn' do
      game.board = [["o", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("3")#game.end? with win
    end

    #isolate this test
    it 'depth = 1 return 3 with 2 options x turn' do
      game.board = [["1", "2", "3"],
                    ["4", "o", "6"],
                    ["o", "x", "x"]]#even with total plays 9 total plays/depth

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("3")#game.end? with win
    end

    it 'return 3 with 2 options o turn' do
      game.board = [["1", "2", "3"],
                    ["4", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=9, 'o', scores={})).to eq("3")#game.end? with win
    end

    end


end