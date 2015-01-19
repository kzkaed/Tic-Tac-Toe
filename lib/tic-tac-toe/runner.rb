require 'tic-tac-toe/game'



module TicTacToe

  class Runner
    attr_reader :game, :user_interface, :player1, :player2

    def initialize(game, user_interface, player1, player2)
      @game = game
      @user_interface = user_interface
      @player1 = player1
      @player2 = player2


    end

    def run
      @user_interface.display_board(@game.board)

      until(@game.end?)
        current_move = @player1.get_move
        current_board = @game.place_move(current_move, @player1.mark)
        @user_interface.display_board(current_board)
        @game.board = current_board
        break if @game.end?

        current_move = @player2.get_move
        current_board = @game.place_move(current_move, @player2.mark)
        @user_interface.display_board(current_board)
        @game.board = current_board

      end
      @user_interface.output("results: win?" + @game.winner?.inspect+" draw?" + @game.draw?.inspect)
    end

  end

end