$: << File.expand_path(File.dirname(__FILE__) + '/../lib')

require 'tic-tac-toe/console'
#require 'tic-tac-toe/human_player'
#require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/game'
require 'tic-tac-toe/runner'

game = TicTacToe::Game.new
user_interface = TicTacToe::Console.new
#player1 = TicTacToe::Player.new
#player2 = TicTacToe::Player.new

TicTacToe::Runner.new(game, user_interface).run