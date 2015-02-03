require 'spec_helper'
require 'tic-tac-toe/console.rb'
require 'tic-tac-toe/game'
require 'mocks/mock_io'

describe TicTacToe::Console do

  let(:game){ TicTacToe::Game.new }
  let!(:io) { MockIO.new }
  let(:console) { described_class.new(io) }


  it 'displays welcome message' do
    console.prepare
    expect( io.puts_string).to eq("\e[1;35mWelcome to Tic Tac Toe\e[0m")
  end

  it 'puts a board with numbered cells via game board' do
    board = game.board
    console.display_board(board)
    expect(io.puts_string).to eq("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9")
  end

  it 'displays a formatted board' do
    board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    console.display_board(board)
    expect(io.puts_string).to eq("\n \e[30;46mx\e[0m | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9")

    board2 = [
        ["x", "o", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    console.display_board(board2)
    expect(io.puts_string).to eq("\n \e[30;46mx\e[0m | \e[37;41mo\e[0m | 3 \n 4 | 5 | 6 \n 7 | 8 | 9")

    board_final = [
        ["x", "o", "o"],
        ["x", "x", "6"],
        ["x", "8", "o"]
    ]
    console.display_board(board_final)
    expect(io.puts_string).to eq("\n \e[30;46mx\e[0m | \e[37;41mo\e[0m | \e[37;41mo\e[0m \n \e[30;46mx\e[0m | \e[30;46mx\e[0m | 6 \n \e[30;46mx\e[0m | 8 | \e[37;41mo\e[0m")

  end

  it 'prompts the player and receives input' do
    io.gets_string = 1.to_s
    expect(console.receive_cell_number(game)).to eq("1")
  end

  it 'displays results' do
    allow(game).to receive(:winner?).and_return(true)
    allow(game).to receive(:draw?).and_return(false)

    game.board = [["x", "o", "3"],
                  ["x", "o", "6"],
                  ["x", "8", "9"]]

    result_string = "\e[1;5;34mA Win!\e[0m\n\e[1;35mPlayer 1\e[0m is the winner with \e[30;46mx\e[0m\n"
    console.display_game_result("x", "o", game)
    expect(io.puts_string).to eq(result_string)

  end

  it 'prompts to play again and receives input Y' do
    io.gets_string = 'Y'
    expect(console.play_again?).to eq(true)
  end

  it 'prompts to play again and receives input y' do
    io.gets_string = 'y'
    expect(console.play_again?).to eq(true)
  end

  it 'prompts to play again and receives input' do
    io.gets_string = ' '
    expect(console.play_again?).to eq(false)
  end


end
