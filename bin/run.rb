$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'tic-tac-toe/console'
require 'tic-tac-toe/human_player'
require 'tic-tac-toe/game'
require 'tic-tac-toe/runner'
require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/ai_alfred'
require 'tic-tac-toe/ai_minimax'

game = TicTacToe::Game.new
user_interface = TicTacToe::Console.new
computer_ai = TicTacToe::AI_Alfred.new
player1 = nil
player2 = nil

if ARGV[0] == 'H'
  ARGV.clear
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
else
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
player2 = TicTacToe::ComputerPlayer.new(2, computer_ai)
end

TicTacToe::Runner.new(game, user_interface, player1, player2).run