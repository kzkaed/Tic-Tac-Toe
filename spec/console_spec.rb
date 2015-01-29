require 'spec_helper'
require 'tic-tac-toe/console.rb'
require 'tic-tac-toe/game'

describe TicTacToe::Console do

  let(:console) { described_class.new }
  #TODO game class let and clean Game.new from each it
  let(:game){ TicTacToe::Game.new }


  before do
    $stdout = StringIO.new
    $stdin = StringIO.new
  end
  after(:all) do
    $stdout = STDOUT
    $stdin = STDIN
  end

  it 'displays welcome message' do
    expect { console.prepare }.to output("\e[1;35mWelcome to Tic Tac Toe\e[0m\n").to_stdout
  end

  it 'puts a board with numbered cells via game board' do
    #game = TicTacToe::Game.new
    board = game.board
    expect { console.display_board(board) }.to output("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
  end


  it 'displays a formatted board' do
    board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    expect { console.display_board(board) }.to output("\n \e[30;46mx\e[0m | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout

    board2 = [
        ["x", "o", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    expect { console.display_board(board2) }.to output("\n \e[30;46mx\e[0m | \e[37;41mo\e[0m | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout

    board_final = [
        ["x", "o", "o"],
        ["x", "x", "6"],
        ["x", "8", "o"]
    ]
    expect { console.display_board(board_final) }.to output("\n \e[30;46mx\e[0m | \e[37;41mo\e[0m | \e[37;41mo\e[0m \n \e[30;46mx\e[0m | \e[30;46mx\e[0m | 6 \n \e[30;46mx\e[0m | 8 | \e[37;41mo\e[0m\n").to_stdout
  end

  it 'prompts the player and receives input' do
    $stdin.string = 1.to_s
    game = TicTacToe::Game.new
    expect(console.receive_cell_number(game)).to eq(1.to_s)
  end

  it 'displays results' do
    result = {'winner' => true,
              'draw' => false,
              'mark' => 'x',
              'player' => 'player 1'}

    game = TicTacToe::Game.new
    allow(game).to receive(:winner?).and_return(true)
    allow(game).to receive(:draw?).and_return(false)

    game.board = [["x", "o", "3"],
                  ["x", "o", "6"],
                  ["x", "8", "9"]]

    result_string_hold = "\e[1;5;34mA Win!\e[0m\n\e[1;35mPlayer 1\e[0m is the winner with \e[30;46mx\e[0m\n10\n0\n"
    result_string = "\e[1;5;34mA Win!\e[0m\n\e[1;35mPlayer 1\e[0m is the winner with \e[30;46mx\e[0m\n"

    expect { console.display_game_result("x", "o", game) }.to output(result_string).to_stdout
  end

  it 'plays again prompt and input' do
    $stdin.string = "Y"
    expect(console.play_again?).to eq(true)
  end

  it 'prompts to play again and receives input Y' do
    $stdin.string = 'Y'
    expect(console.play_again?).to eq(true)
  end

  it 'prompts to play again and receives input y' do
    $stdin.string = 'y'
    expect(console.play_again?).to eq(true)
  end

  it 'prompts to play again and receives input' do
    $stdin.string = ' '
    expect(console.play_again?).to eq(false)
  end


end
