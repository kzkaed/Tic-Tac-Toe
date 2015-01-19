module TicTacToe

  class HumanPlayer

    attr_accessor :player_number, :mark, :moves, :move

    def initialize(player_number, user_interface)
      @user_interface = user_interface
      @player_number = player_number
      @mark = player_mark
      @moves = []
      @move = move
    end


    def player_mark
      return 'x' if @player_number == 1
      return 'o' if @player_number == 2
    end


    def get_move
      move = @user_interface.in_move
      move.chomp
    end
  end
end