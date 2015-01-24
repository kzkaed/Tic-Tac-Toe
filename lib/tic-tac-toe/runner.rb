require 'tic-tac-toe/game'


module TicTacToe

  class Runner
    attr_reader :game, :user_interface, :player1, :player2
    attr_accessor :first_time_run

    def initialize(game, user_interface, player1, player2)
      @game = game
      @user_interface = user_interface
      @player1 = player1
      @player2 = player2
      @first_time_run = true
    end

    def run

      @user_interface.prepare if first_time_run
      @user_interface.display_board(@game.board)

      until (@game.end?)
        current_move = @player1.determine_move(@game)
        current_board = @game.process_turn(current_move, @player1.mark)
        @user_interface.display_board(current_board)
        @game.board = current_board
        break if @game.end?

        current_move = @player2.determine_move(@game)
        current_board = @game.process_turn(current_move, @player2.mark)
        @user_interface.display_board(current_board)
        @game.board = current_board
      end

      @user_interface.display_game_result(@player1.mark, @player2.mark, @game)

      run_again if @user_interface.play_again?
    end

    def run_again
      @game.clear
      @first_time_run = false
      run
    end


  end

end