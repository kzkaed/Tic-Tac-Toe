module TicTacToe
  class ComputerPlayer

    attr_accessor :player_number, :mark, :moves, :move

    def initialize(player_number)
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
      move = #return a cell_number
    end


  end
end
