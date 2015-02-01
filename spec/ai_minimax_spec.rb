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


=begin
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
=end


context 'x seed' do
    it 'o best move is 3 to block, 3 options available' do
      game.board = [["x", "o", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "9"]]

      expect(ai_minimax.natalie(game, depth=0, 'x', scores={})).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end


    it 'x best move is 3 to block with 3 options available' do
      game.board = [["o", "2", "3"],
                    ["x", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'x', scores={})).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end


    it 'o best move is 3 with 5 options available' do
      game.board = [["1", "2", "3"],
                    ["4", "o", "6"],
                    ["o", "x", "x"]]

      expect(ai_minimax.natalie(game, depth=0, 'x', scores={})).to eq(0)
      expect(ai_minimax.best_move).to eq("3")
    end

    it 'x best move is 3 to win with 5 options available' do
      game.board = [["1", "2", "3"],
                    ["4", "x", "6"],
                    ["x", "o", "o"]]

      expect(ai_minimax.natalie(game, depth=0, 'x', scores={})).to eq(3)
      expect(ai_minimax.best_move).to eq("3")
    end
end


context 'o seed' do
  it 'o best move is 3 to block with 3 options available' do
    game.board = [["x", "o", "3"],
                  ["x", "o", "6"],
                  ["o", "x", "9"]]

    expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq(1)#win
    expect(ai_minimax.best_move).to eq("3")
  end


  it 'x best move is 3 to block with 3 options available' do
    game.board = [["o", "2", "3"],
                  ["x", "o", "6"],
                  ["o", "x", "x"]]

    expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq(1)
    expect(ai_minimax.best_move).to eq("3")
  end


  it 'o best move is 3 to block with 5 options available' do
    game.board = [["1", "2", "3"],
                  ["4", "o", "6"],
                  ["o", "x", "x"]]#is to win

    expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq(3)
    expect(ai_minimax.best_move).to eq("3")
  end

  it 'x best move is 3 to win with 5 options available' do
    game.board = [["1", "2", "3"],
                  ["4", "x", "6"],
                  ["x", "o", "o"]]#to block

    expect(ai_minimax.natalie(game, depth=0, 'o', scores={})).to eq(2)
    expect(ai_minimax.best_move).to eq("3")
  end

  end

  it'test change to integer ' do
      mark = 'o'
      mark = 'x'
      depth = 5
      allow(game).to receive(:winner).and_return('x')
      #sign = sign(mark)
      expect(ai_minimax.change_to_integer_representation('o',game)).to eq(-1)
      expect(ai_minimax.change_to_integer_representation('x',game)).to eq(1)
    end

    it'test value ' do

      allow(game).to receive(:winner?).and_return(true)
      mark = 'x'

      depth = 5
      #sign = sign(mark)
      #-1 * 5 * -1 = 5
      expect(ai_minimax.value(game, mark,depth)).to eq(-5)

    end




  it 'return min' do
      scores = {"1"=>6, "2"=>-5, "3"=>8, "4"=>6, "6"=>6}
      expect(ai_minimax.min_move(scores)).to eq("2")
    end





end