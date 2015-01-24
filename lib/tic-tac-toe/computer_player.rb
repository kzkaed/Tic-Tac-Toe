
module TicTacToe
  class ComputerPlayer

    attr_accessor :player_number, :mark, :moves, :move

    def initialize(player_number, computer_ai)
      @player_number = player_number
      @mark = player_mark
      @moves = []
      @move = move
      @alfred = computer_ai
    end

    def player_mark
      return 'x' if @player_number == 1
      return 'o' if @player_number == 2
    end


    def determine_move
      move = @alfred.get_best_move
      move.chomp
    end


  end
end
