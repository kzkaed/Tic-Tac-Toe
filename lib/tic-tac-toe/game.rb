module TicTacToe

  class Game
    attr_accessor :board, :board_map, :winner_mark

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

    end

    def place_move(move, mark)
      current_board = create_board(move, mark)
      @boards << current_board
      return @boards.pop
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

    def clear
      @board = [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]
      ]
    end

    def compile_result(mark1, mark2)
      player = set_winning_player(mark1, mark2)
      {'winner' => winner?,
       'draw' => draw?,
       'mark' => winner_mark,
       'player' => player}
    end


    def set_winning_mark(win_type)
      @winner_mark = win_type.uniq[0]
    end

    def set_winning_player(mark1, mark2)
      if @winner_mark == mark1 #player info don't like this
        player = "player 1" #player1.name
      elsif @winning_mark == mark2
        player = "player 2" #player2.name
      end
      player
    end

    def get_cell(row, column)
      board[row][column]
    end

    private
    def create_board(move, mark)
      @board_map.each_pair do |cell_number, coordinate|
        if move == cell_number
          set_cell(coordinate[0], coordinate[1], mark)
        end
      end
      board
    end

    def set_cell(row, column, mark)
      board[row][column]= mark
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


  end
end