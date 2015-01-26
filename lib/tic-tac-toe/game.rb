module TicTacToe

  class Game
    attr_accessor :board, :board_map, :winner_mark, :scores, :moves, :boards

    def initialize
      @board = [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]
      ]
      @board_map = {
          "1" => [0, 0],
          "2" => [0, 1],
          "3" => [0, 2],
          "4" => [1, 0],
          "5" => [1, 1],
          "6" => [1, 2],
          "7" => [2, 0],
          "8" => [2, 1],
          "9" => [2, 2]
      }

      @boards = []
      @winner_mark =""
      @winner_marks = []
      @scores= []
      @moves = []


    end

    def process_turn(move, mark)
      p "in process turn"
      current_board = create_board(move, mark)
      collect_moves(move)
      collect_boards(current_board)
      return current_board
    end


    def end?
      winner? || draw?
    end

    def winner?
      diagonal? || across? || down?
    end

    def draw?
      remaining_values = board.flatten.uniq.length
      return remaining_values == 2 && !winner?
    end

    def score
      if winner? && winner_mark == 'o' #max
        return 10
      elsif winner? && winner_mark == 'x' #min
        return -10
      else
        return 0
      end
    end

    def diagonal?
      diagonal_ascent? || diagonal_descent?
    end


    def down?
      (0..2).each_with_index do |column|
        down = []
        (0..2).each_with_index do |row|
          down << get_cell(row, column)
        end
        if down.uniq.length == 1
          set_winning_mark(down)
          return true
        end
      end
      return false
    end

    def across?
      (0..2).each_with_index do |row|
        across = []
        (0..2).each_with_index do |column|
          across << get_cell(row, column)
        end
        if across.uniq.length == 1
          set_winning_mark(across)
          return true
        end
      end

      return false
    end

    def set_winning_mark(win_type)
      @winner_mark = win_type.uniq[0]
    end

    def clear
      @moves = []
      @board = [["1", "2", "3"],
                ["4", "5", "6"],
                ["7", "8", "9"]]
    end

    #******These get to board directly, could be used from AI only

    def clear_at(cell)
      coordinate = @board_map.fetch(cell)
      set_cell(coordinate[0],coordinate[1],cell)
    end

    def set_at(cell,mark)
      coordinate = @board_map.fetch(cell)
      set_cell(coordinate[0],coordinate[1],mark)
      nil
    end

    def get_at(cell)
      coordinate = @board_map.fetch(cell)
      get_cell(coordinate[0],coordinate[1])
    end

    def get_cell(row, column)
      board[row][column]
    end

    def set_cell(row, column, mark)
      board[row][column]= mark
    end


    def create_board(move, mark)
      set_at(move, mark)
      board
    end
    private





    def collect_moves(move)
      @moves<< move
    end

    def collect_boards(current_board)
      @boards << current_board
    end


    def diagonal_descent?
      diagonal = []
      (0..2).each_with_index do |index|
        diagonal << get_cell(index, index)
      end
      if diagonal.uniq.length == 1
        set_winning_mark(diagonal)
        return true
      end
      return false
    end

    def diagonal_ascent?
      diagonal = []
      (0..2).each_with_index do |index|
        diagonal << get_cell(index, 2 - index)
      end
      if diagonal.uniq.length == 1
        set_winning_mark(diagonal)
        return true
      end
      return false
    end

    def deprecated_create_board(move, mark)#remove
      @board_map.each_pair do |cell_number, coordinate|
        if move == cell_number
          set_cell(coordinate[0], coordinate[1], mark)
        end
      end
      board
    end


  end
end


