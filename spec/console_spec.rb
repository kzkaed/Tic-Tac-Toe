require 'spec_helper'
require 'tic-tac-toe/console.rb'
require 'tic-tac-toe/game'

describe TicTacToe::Console do

  let(:console) {described_class.new}

  before do
    $stdout = StringIO.new
    $stdin = StringIO.new
  end
  after(:all) do
    $stdout = STDOUT
    $stdin = STDIN
  end

  it 'puts a board with numbered cells via game board' do
    game = TicTacToe::Game.new
    board = game.board
    expect{console.display_board(board)}.to output("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
  end

  it 'displays a formatted board' do
    board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    expect{console.display_board(board)}.to output("\n x | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout

    board2 = [
        ["x", "o", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    expect{console.display_board(board2)}.to output("\n x | o | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout

    board_final = [
        ["x", "o", "o"],
        ["x", "x", "6"],
        ["x", "8", "o"]
    ]
    expect{console.display_board(board_final)}.to output("\n x | o | o \n x | x | 6 \n x | 8 | o\n").to_stdout
  end

  it 'prompts the player and receives input' do
    $stdin.string = 1.to_s
    expect(console.receive_cell_number).to eq(1.to_s)
  end

  it 'displays results' do
    result = {'winner' => true,
              'draw' => false,
              'mark' => 'x',
              'player' => 'player 1'}
    result_string = "winner: true\ndraw: false\nmark: x\nplayer: player 1\n"
    expect{console.display_game_result(result)}.to output(result_string).to_stdout
  end

  it 'plays again prompt and input' do
    $stdin.string = "Y"
    expect(console.play_again?).to eq(true)
  end


end
