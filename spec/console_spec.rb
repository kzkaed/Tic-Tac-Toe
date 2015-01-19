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



  it 'puts a message to the console' do
    console.output('a message')
    expect($stdout.string).to match('a message')
    expect{console.output('output')}.to output("output\n").to_stdout
  end

  it 'gets message from user via console' do
    $stdin.string = 'message'
    expect(console.input).to match('message')
  end

  it 'puts a board string to console via out' do
    board_string = "\n - | - | - \n - | - | - \n - | - | -"
    expect {console.output(board_string)}.to output("\n - | - | - \n - | - | - \n - | - | -\n").to_stdout
  end

  it 'puts a board with numbered cells with string constant' do
    expect{console.display_board_cell_numbers}.to output("\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9\n").to_stdout
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
    expect(console.in_move).to eq(1.to_s)
  end


  it 'validates user input' do
    input = 1.to_s
    validated_input = 1.to_s
    expect(console.validate(input)).to eq(validated_input)
  end





  #expect { actual }.to output("some output").to_stdout
  #expect { actual }.to output("").to_stderr
end