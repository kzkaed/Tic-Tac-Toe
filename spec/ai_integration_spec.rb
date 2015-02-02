require 'spec_helper'
require 'mocks/mock_user_interface'
require 'tic-tac-toe/game'
require 'tic-tac-toe/console'
require 'tic-tac-toe/runner'
require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/ai_minimax'

describe "Integration Test" do

  it "plays ai's against each other" do
    game = TicTacToe::Game.new
    #user_interface = TicTacToe::Console.new
    user_interface = MockUserInterface.new
    ai = TicTacToe::AI_Minimax.new

    player1 = TicTacToe::ComputerPlayer.new(1, ai)
    player2 = TicTacToe::ComputerPlayer.new(2, ai)

    TicTacToe::Runner.new(game, user_interface, player1, player2).run
    expect(game.winner?).to eq  (false)
    expect(game.draw?).to eq(true)
  end
end