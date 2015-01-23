$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'tic-tac-toe/console'
require 'tic-tac-toe/human_player'
require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/game'
require 'tic-tac-toe/runner'

game = TicTacToe::Game.new
user_interface = TicTacToe::Console.new
player1 = nil
player2 = nil
if ARGV[0] == 'C'
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::ComputerPlayer.new(2)
else
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
end

TicTacToe::Runner.new(game, user_interface, player1,player2).run