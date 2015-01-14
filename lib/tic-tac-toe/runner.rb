require 'tic-tac-toe/game'



module TicTacToe

  class Runner
    attr_reader :game, :user_interface

    def initialize(game, user_interface)
      @game = game
      @user_interface = user_interface

    end

    def run
      @user_interface.out_board(@game.matrix)

    end

  end

end