module TicTacToe
  class Console

    attr_accessor :board_string

    def initialize
      @board_string2 = "\n x | o | x \n x | o | x \n x | o | x"
      @board_string = "\n - | - | - \n - | - | - \n - | - | -"


    end


    def out(value)
      puts value
    end

    def in
      gets
    end

    def out_board(board)
      remake_board_string = @board_string.dup
      remake_board_string
      out(board_string)
    end


  end
end
