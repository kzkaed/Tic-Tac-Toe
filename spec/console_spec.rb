require 'spec_helper'
require 'tic-tac-toe/console.rb'

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



  it 'uses out to put a message to the console' do
    console.out('a message')
    expect($stdout.string).to match('a message')
    expect{console.out('output')}.to output("output\n").to_stdout
  end

  it 'uses console in to get message from user via console' do
    $stdin.string = 'message'
    expect(console.in).to match('message')
  end

  it 'puts a board string to console via out' do
    board_string = "\n - | - | - \n - | - | - \n - | - | -"
    expect {console.out(board_string)}.to output("\n - | - | - \n - | - | - \n - | - | -\n").to_stdout
  end

  it 'has a board string' do
    expect(console.board_string).to eq("\n - | - | - \n - | - | - \n - | - | -")
  end

  it 'can put board_string to console using @board_string' do
    expect{console.out(console.board_string)}.to output("\n - | - | - \n - | - | - \n - | - | -\n").to_stdout
  end







  #expect { actual }.to output("some output").to_stdout
  #expect { actual }.to output("").to_stderr
end