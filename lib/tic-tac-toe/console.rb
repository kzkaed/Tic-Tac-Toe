module TicTacToe
  class Console

    CELL_NUMBER_PROMPT = "Enter a cell number: "

    def initialize
      @cell_number_prompt = CELL_NUMBER_PROMPT
    end

    def display_board(board)
      output(create_board_output(board))
    end

    def receive_cell_number
      cell_number = ''
      output(@cell_number_prompt)
      cell_number = input
    end

    def output(value)
      puts value
    end

    def input
      gets.chomp
    end

    def display_game_result(result)
      result_string = "win?#{result["winner"]} draw?#{result["draw"]}"
      #do some stuff on result
      output(result_string)
    end

    def play_again?
      output("play again? Y for yes, else no")
      response = input
      return response == 'Y'
    end


    private
    def create_board_output(board)
      cell_numbers = "\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9"
      collect = ""
      board.each do |row|
        row.each do |cell|
          collect<<cell
        end
      end
      (1..9).each do |cell|
        cell_numbers.gsub!(/#{cell.to_s}/, collect[cell-1])
      end
      cell_numbers
    end

  end
end
