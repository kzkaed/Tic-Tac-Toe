module TicTacToe

  class Game
    attr_accessor :board, :board_map
    def initialize
      @board = [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]
      ]
      @board_map =  {
          "1" => [0,0],
          "2" => [0,1],
          "3" => [0,2],
          "4" => [1,0],
          "5" => [1,1],
          "6" => [1,2],
          "7" => [2,0],
          "8" => [2,1],
          "9" => [2,2]
      }

      @boards = []

    end


    def place_move(move, mark)
      current_board = create_board(move,mark)
      @boards << current_board
      return @boards.pop
    end

    def get_cell(row, column)
      return board[row][column]
    end

    def set_cell(row,column,mark)
      board[row][column]= mark
    end


    def end?
      return true if winner? || draw?
      false
    end

    def winner?
      return true if diagonal?
      return true if across?
      return true if down?
      false
    end

    def draw?
      remaining_values = board.flatten.uniq.length
      return true if remaining_values == 2
      false

    end

    def diagonal?
      diagonal = []
      (0..2).each_with_index do |index|
        diagonal << get_cell(index,index)
      end
      return true if diagonal.uniq.length == 1

      diagonal = []
      (0..2).each_with_index do |index|
        diagonal << get_cell(index, 2 - index)
      end
      return true if diagonal.uniq.length == 1

      false
    end

    def down?
      down = []
      (0..2).each_with_index do |index|
        down << get_cell(index,0)
      end
      return true if down.uniq.length == 1

      down = []
      (0..2).each_with_index do |index|
        down << get_cell(index,1)
      end
      return true if down.uniq.length == 1

      down = []
      (0..2).each_with_index do |index|
        down << get_cell(index,2)
      end
      return true if down.uniq.length == 1
      false
    end

    def across?
      across = []
      (0..2).each_with_index do |index|
        across << get_cell(0,index)
      end
      return true if across.uniq.length == 1

      across = []
      (0..2).each_with_index do |index|
        across << get_cell(1,index)
      end
      return true if across.uniq.length == 1

      across = []
      (0..2).each_with_index do |index|
        across << get_cell(2,index)
      end
      return true if across.uniq.length == 1
      false
    end

    def play_again?
      false
    end

    def clear
      @board = [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]
      ]
    end

    private
    def create_board(move,mark)
      @board_map.each_pair do |cell_number, coordinate|
        if move == cell_number
          set_cell(coordinate[0],coordinate[1],mark)
        end
      end
      board
    end

  end
end