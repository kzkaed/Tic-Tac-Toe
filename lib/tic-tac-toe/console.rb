module TicTacToe
  class Console

    CELL_NUMBERS = "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9"
    CELL_DASHES = "\n - | - | - \n - | - | - \n - | - | -"


    def initialize
      @cell_dashes = CELL_DASHES
      @cell_numbers = CELL_NUMBERS


    end

    def display_board_cell_numbers
      output(@cell_numbers)
    end

    def display_board(board)
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
      output(output_string)
    end

    def in_move
      move = ''
       output("Enter a cell number: ")
       move = input
    end

    def validate(input)
      validated_input = input
      #pending
      return validated_input
    end

    def output(value)
      puts value
    end

    def input
      gets
    end




  end
end
