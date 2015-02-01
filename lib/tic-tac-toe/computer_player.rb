module TicTacToe
  class ComputerPlayer

    attr_accessor :player_number, :mark

    def initialize(player_number, computer_ai)
      @player_number = player_number
      @mark = player_mark

      @computer_ai = computer_ai
    end

    def player_mark
      return 'x' if @player_number == 1
      return 'o' if @player_number == 2
    end


    def determine_move(game)
      move = @computer_ai.get_best_move(game,mark)
      move.chomp
    end

  end
end
