require 'spec_helper'
require 'tic-tac-toe/presenter.rb'
require 'tic-tac-toe/game'
require 'tic-tac-toe/color_string'

describe TicTacToe::Presenter do




  it 'compiles result' do
    presenter = TicTacToe::Presenter.new(TicTacToe::ColorString.new)

    mark1 = 'x'
    mark2 = 'o'

    game = TicTacToe::Game.new
    allow(game).to receive(:winner?).and_return(true)
    allow(game).to receive(:draw?).and_return(false)
    allow(game).to receive(:winner_mark).and_return('x')

    result = {:winner=>"\e[1;5;34mA Win!\e[0m", :player=>"\e[1;35mPlayer 1\e[0m is the winner with \e[30;46mx\e[0m"}

    expect(presenter.compile_result(mark1,mark2,game)).to eq(result)
  end


  it 'compiles result' do
    presenter = TicTacToe::Presenter.new(TicTacToe::ColorString.new)

    mark1 = 'x'
    mark2 = 'o'

    game = TicTacToe::Game.new
    allow(game).to receive(:winner?).and_return(false)
    allow(game).to receive(:draw?).and_return(true)
    allow(game).to receive(:winner_mark).and_return(' ')

    result = {:draw=>"\e[1;5;34mMEOW\e[0m, Cat's Game!"}

    expect(presenter.compile_result(mark1,mark2,game)).to eq(result)
  end


end