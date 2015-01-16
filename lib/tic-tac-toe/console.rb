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
           collect<<cell.to_s
        end
      end
      output_string.gsub!(/1/,collect[0])
      output_string.gsub!(/2/,collect[1])
      output_string.gsub!(/3/,collect[2])
      output_string.gsub!(/4/,collect[3])
      output_string.gsub!(/5/,collect[4])
      output_string.gsub!(/6/,collect[5])
      output_string.gsub!(/7/,collect[6])
      output_string.gsub!(/8/,collect[7])
      output_string.gsub!(/9/,collect[8])

      out(output_string)
    end

    def out_board_cell_numbers
      out(@cell_numbers)
    end

  end
end
