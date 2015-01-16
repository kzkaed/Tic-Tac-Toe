module TicTacToe
  class Console

    attr_accessor :board_string

    CELL_NUMBERS = "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9"


    def initialize
      @board_string = "\n - | - | - \n - | - | - \n - | - | -"
      @cell_numbers = CELL_NUMBERS


    end


    def out(value)
      puts value
    end

    def in
      gets
    end

    def out_board(board)
      output_string = "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9"
      collect = ""
      board.each do |row|
        row.each do |cell|
          collect<<cell
        end
      end
      (1..9).each do |cell|
        output_string.gsub!(/#{cell.to_s}/, collect[cell-1])
      end
      out(output_string)
    end

    def out_board_cell_numbers
      out(@cell_numbers)
    end

  end
end
