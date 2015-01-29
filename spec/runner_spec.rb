require 'spec_helper'
require 'tic-tac-toe/runner.rb'
require 'mocks/mock_game'
require 'mocks/mock_user_interface'
require 'mocks/mock_player'

describe TicTacToe::Runner do

  let!(:game) { MockGame.new }
  let!(:user_interface) { MockUserInterface.new }
  let!(:player1) { MockPlayer.new(1) }
  let!(:player2) { MockPlayer.new(2) }

  let(:runner) { described_class.new(game, user_interface, player1, player2) }

  it 'creates a game' do
    expect(runner.game).to eq(game)
  end

  it 'creates a user interface' do
    expect(runner.user_interface).to eq(user_interface)
  end

  it 'create player1 and player2' do
    expect(runner.player1).to eq(player1)
    expect(runner.player2).to eq(player2)
  end

  it 'user interface displays game introduction' do
    runner.run
    expect(user_interface.prepare).to eq(true)
  end

  it 'user interface displays board' do
    runner.run
    expect(user_interface.display_board_called?).to eq(true)
  end


  it "player1 get move from user interface" do
    move = "1"
    player1.moves << move
    runner.run
    expect(player1.determine_move(game)).to eq("1")
    expect(player1.get_move_called?).to eq(true)

  end

  it "player2 gets move from ai" do
    move = "2"
    player2.moves << move
    runner.run
    expect(player2.determine_move(game)).to eq("2")
    expect(player2.get_move_called?).to eq(true)

  end

  it 'send move and player to game and get a board' do
    move = "1"
    mark = "x"
    game.boards << [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]

    current_board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    runner.run
    expect(game.process_turn(move, mark)).to eq(current_board)
    expect(game.place_move_called?).to eq(true)

  end

  it 'updates game.board to current board' do
    game.boards << [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]


    current_board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]

    runner.run

    expect(game.boards.pop).to eq(current_board)
  end

  it 'breaks if game end ' do
    runner.run
    expect(game.end_called?).to be(true)
  end

  it "player2 get move from user interface" do
    move = "1"
    player2.moves << move
    runner.run
    expect(player2.determine_move(game)).to eq("1")
    expect(player2.get_move_called?).to eq(true)
  end

  it 'user interface displays results' do
    runner.run
    expect(user_interface.display_game_result_called?).to eq(true)
  end

  it 'gets play again response from user interface, if false,game ends' do
    user_interface.play_again << false
    runner.run
    expect(user_interface.play_again_called?).to eq(true)
    expect(game.clear_called?).to eq(false)
  end

  it 'gets play again response from user interface, if true, play game again' do
    user_interface.play_again << true
    runner.run
    expect(user_interface.play_again_called?).to eq(true)
    expect(game.clear_called?).to eq(true)
  end

  it 'plays game again' do
    runner.run_again
    expect(game.clear_called?).to eq(true)
    expect(user_interface.play_again_called?).to eq(true)
  end

  it 'only displays prepare if 1st time in game' do
    runner.run_again
    expect(runner.first_time_run).to eq(false)

  end


end