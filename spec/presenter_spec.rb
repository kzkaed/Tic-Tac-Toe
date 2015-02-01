require 'spec_helper'
require 'tic-tac-toe/presenter.rb'
require 'tic-tac-toe/game'
require 'tic-tac-toe/color_string'

describe TicTacToe::Presenter do

  let(:presenter){described_class.new(TicTacToe::ColorString.new)}
  let(:game){TicTacToe::Game.new}

  it 'compiles result win' do
    mark1 = 'x'
    mark2 = 'o'
    allow(game).to receive(:winner?).and_return(true)
    allow(game).to receive(:draw?).and_return(false)
    game.board = [["x", "o", "3"],
                  ["x", "o", "6"],
                  ["x", "8", "9"]]

    result = {:winner => "\e[1;5;34mA Win!\e[0m", :player => "\e[1;35mPlayer 1\e[0m is the winner with \e[30;46mx\e[0m"}
    expect(presenter.compile_result(mark1, mark2, game)).to eq(result)
  end

  it 'compiles result draw' do
    mark1 = 'x'
    mark2 = 'o'
    allow(game).to receive(:winner?).and_return(false)
    allow(game).to receive(:draw?).and_return(true)
    game.board = [["x", "o", "x"],
                  ["x", "o", "o"],
                  ["o", "x", "x"]]

    result = {:draw => "\e[1;5;34mMEOW\e[0m, Cat's Game!"}
    expect(presenter.compile_result(mark1, mark2, game)).to eq(result)
  end

  it 'has a winner mark' do
    board=([["x", "o", "3"],
            ["x", "o", "6"],
            ["x", "8", "9"]])

    expect(presenter.get_win_mark(board)).to eq("x")
  end

  it 'has a result total for game with x winner' do
    allow(game).to receive(:winner?).and_return(true)
    game.board=([["x", "o", "3"],
                 ["x", "o", "6"],
                 ["x", "8", "9"]])

    expect(presenter.score_result(game)).to eq([10, 0])
  end

  it 'has score result total for 2 games' do
    allow(game).to receive(:winner?).and_return(true)
    expect(presenter.score_result(game)).to eq([0, 10])
    game.board=([["x", "o", "3"],
                 ["x", "o", "6"],
                 ["x", "8", "9"]])

    expect(presenter.score_result(game)).to eq([10, 10])
  end

end