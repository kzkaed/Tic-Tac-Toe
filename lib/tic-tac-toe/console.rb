require_relative '../tic-tac-toe/color_string'
require_relative '../tic-tac-toe/presenter'
module TicTacToe
  class Console

    attr_accessor :ansi_color, :presenter
    CELL_NUMBER_PROMPT = "Enter a cell number: "
    WELCOME = "Welcome to Tic Tac Toe"

    def initialize
      @ansi_color = TicTacToe::ColorString.new
      @presenter = TicTacToe::Presenter.new(@ansi_color)

      @cell_number_prompt = CELL_NUMBER_PROMPT
      @welcome = @ansi_color.magenta_bright(WELCOME)
    end

    def prepare
      output(@welcome)
    end

    def display_board(board)
      board_string = create_board_output(board)
      new_board_string = add_color(board_string)
      output(new_board_string)
    end

    def receive_cell_number(game)
      cell_number = ''
      output(@cell_number_prompt)
      cell_number = input
      validate(cell_number, game)
    end

    #TODO add result for presenter.score
    def display_game_result(mark1, mark2, game)
      result = @presenter.compile_result(mark1, mark2, game)
      result.each_value { |value| output("#{value}") }
    end

    def play_again?
      output("\nPlay again? Y for yes, else no")
      response = input
      return response.capitalize == 'Y'
    end


    private
    def add_color(board_string)
      board_string.gsub!(/x/, @ansi_color.black_on_cyan("x"))
      board_string.gsub!(/o/, @ansi_color.white_on_red("o"))
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

    def validate(cell_number, game)
      available_cells = get_possible(game.moves)
      if available_cells.include?(cell_number)
        return cell_number
      else
        receive_cell_number(game)
      end
     end

    def get_possible(moves)
      possible_moves = %w(1 2 3 4 5 6 7 8 9)
      moves.each do |move|
        possible_moves.select! {|num| num != move }
      end
      possible_moves
    end

    def output(value)
      puts value
    end

    def input
      gets.chomp
    end


  end
end
