$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'tic-tac-toe/console'
require 'tic-tac-toe/human_player'
require 'tic-tac-toe/game'
require 'tic-tac-toe/runner'
require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/ai_alfred'
require 'tic-tac-toe/ai_minimax'
require 'tic-tac-toe/audio'

game = TicTacToe::Game.new
audio = TicTacToe::Audio.new
user_interface = TicTacToe::Console.new(io=Kernel,audio)
dumb_ai = TicTacToe::AI_Alfred.new
smart_ai = TicTacToe::AI_Minimax.new
player1 = nil
player2 = nil

if ARGV[0] == 'HC'
  ARGV.clear
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::ComputerPlayer.new(2, smart_ai)
  puts "Human to Computer game running with #{smart_ai.class} AI component"
elsif ARGV[0] == 'D'
  ARGV.clear
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::ComputerPlayer.new(2, dumb_ai)
  puts "Human to Computer game running with #{dumb_ai.class} AI component"
elsif ARGV[0] == 'CH'
  ARGV.clear
  player1 = TicTacToe::ComputerPlayer.new(1, smart_ai)
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
  puts "Computer to Human game running with #{smart_ai.class} AI component"
elsif ARGV[0] == 'CC'
  ARGV.clear
  player1 = TicTacToe::ComputerPlayer.new(1, smart_ai)
  player2 = TicTacToe::ComputerPlayer.new(2,smart_ai)
  puts "Computer to Computer game running with #{smart_ai.class} AI component"
else
  player1 = TicTacToe::HumanPlayer.new(1,user_interface)
  player2 = TicTacToe::HumanPlayer.new(2,user_interface)
  puts "Human to Human game running with #{user_interface.class} user interface component"
end

TicTacToe::Runner.new(game, user_interface, player1, player2).run