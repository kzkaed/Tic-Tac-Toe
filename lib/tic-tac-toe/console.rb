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
      board_string = create_board_output(board)
      new_board_string = add_color(board_string)
      output(new_board_string)
    end

    def receive_cell_number
      cell_number = ''
      output(@cell_number_prompt)
      cell_number = input
    end


    def display_game_result(mark1,mark2,game)
      result = compile_result(mark1,mark2,game)
      result.each_value { |value| output("#{value}") }
    end


    def compile_result(mark1, mark2, game)

      player = set_winning_player(mark1, mark2, game.winner_mark)
      result = {}
      if game.winner?
        result[:winner] = "A Win!"
        result[:player] = "#{player} is the winner"
        #result[:win_mark] = game.winner_mark
      end
      if game.draw?
        result[:draw] = "Cat's Game!"
      end
      result


    end


    def set_winning_player(mark1, mark2, winner_mark)
      return 'player 1' if winner_mark == mark1
      return 'player 2' if winner_mark == mark2
    end

    def play_again?
      output("\nPlay again? Y for yes, else no")
      response = input
      return response == 'Y'
    end



    private

    def add_color(board_string)
      board_string.gsub!(/x/,@ascii_color.black_on_cyan("x"))
      board_string.gsub!(/o/,@ascii_color.white_on_red("o"))
      return board_string
    end

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
