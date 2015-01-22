require_relative '../tic-tac-toe/color_string'
module TicTacToe
  class Console

    attr_accessor :ascii_color
    CELL_NUMBER_PROMPT = "Enter a cell number: "
    WELCOME = "Welcome to Tic Tac Toe"

    def initialize
      @ascii_color = TicTacToe::ColorString.new
      @cell_number_prompt = @ascii_color.blue(CELL_NUMBER_PROMPT)
      @welcome = @ascii_color.red(WELCOME)
    end

    def prepare
      output(@welcome)
    end

    def display_board(board)
      output(create_board_output(board))
    end

    def receive_cell_number
      cell_number = ''
      output(@cell_number_prompt)
      cell_number = input
    end


    def display_game_result(mark1,mark2,game)
      #requires that we know what we are getting-- on client receive a JSON/XML object you know you
      #have to parse it to get out the data, so how is this different? in this case
      #the client(userinteface) is the console and it understands its going to get a serialized object,
      #in this case a hash which it needs to parse to use id and values-- no different. But we
      #definately want to 'parse' object or data structure.

      result = compile_result(mark1,mark2,game)
      result.each { |key, value| output("#{key}: #{value}") }
    end


    def compile_result(mark1, mark2, game)

      player = set_winning_player(mark1, mark2, game.winner_mark)

      {'winner' => game.winner?,
       'draw' => game.draw?,
       'mark' => game.winner_mark,
       'player' => player}
    end


    def set_winning_player(mark1, mark2, winner_mark)
      return 'player 1' if winner_mark == mark1
      return 'player 2' if winner_mark == mark2
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

    def output(value)
      puts value
    end

    def input
      gets.chomp
    end

  end
end
