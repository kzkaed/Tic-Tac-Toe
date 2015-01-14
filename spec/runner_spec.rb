require 'spec_helper'
require 'tic-tac-toe/runner.rb'
require 'mocks/mock_game'
require 'mocks/mock_user_interface'


describe TicTacToe::Runner do

  let!(:game) { MockGame.new }
  let!(:user_interface){MockUserInterface.new}
  let(:runner) { described_class.new(game,user_interface)}

  it 'creates a game' do
    expect(runner.game).to eq(game)
  end

  #describe behavior!
  it 'creates a user interface' do
    expect(runner.user_interface).to eq(user_interface)
  end

  it 'it displays board in user_interface' do
    runner.run

    expect(user_interface.out_board(game)).to eq(true)
  end


end