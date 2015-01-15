require 'spec_helper'
require 'tic-tac-toe/runner.rb'
require 'mocks/mock_game'
require 'mocks/mock_user_interface'
require 'mocks/mock_player'


describe TicTacToe::Runner do

  let!(:game) { MockGame.new }
  let!(:user_interface){MockUserInterface.new}
  let!(:player) {MockPlayer.new}
  let(:runner) { described_class.new(game,user_interface)}

  it 'creates a game' do
    expect(runner.game).to eq(game)
  end

  #describe behavior!
  it 'creates a user interface' do
    expect(runner.user_interface).to eq(user_interface)
  end

  it 'user interface displays board' do
    runner.run

    expect(user_interface.out_board(game)).to eq(true)
  end

  it 'user_interface displays board with cell numbers for reference' do
    runner.run
    expect(user_interface.out_board_cell_numbers_called?).to eq(true)
  end

  it "user interface displays player 1 move" do
    move = 1
    player.moves << 1
    runner.run

    expect(player.make_move_called?).to eq(false)
  end


end