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
dumb_ai = TicTacToe::AI_Alfred.new
smart_ai = TicTacToe::AI_Minimax.new
player1 = nil
player2 = nil

if ARGV[0] == 'H'
  ARGV.clear
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
  puts "Human to human game running with #{user_interface.class} user interface component"
elsif ARGV[0] == 'D'
  ARGV.clear
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::ComputerPlayer.new(2, dumb_ai)
  puts "Human to computer game running with #{dumb_ai.class} AI component"
elsif ARGV[0] == 'C'
  ARGV.clear
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
  player1 = TicTacToe::ComputerPlayer.new(1, smart_ai)
  puts "Human to computer game running with #{dumb_ai.class} AI component"
else
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::ComputerPlayer.new(2, smart_ai)
  puts "Human to computer game running with #{smart_ai.class} AI component"
end

TicTacToe::Runner.new(game, user_interface, player1, player2).run