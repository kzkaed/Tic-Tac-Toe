module TicTacToe

  class Game
    attr_accessor :board
    def initialize
      @board = [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"]
      ]

      @boards = []

    end


    def place_move(move, mark)

      if move == "1"
        set_cell(0,0,mark)
      elsif move == "2"
        set_cell(0,1,mark)
      elsif move == "3"
        set_cell(0,2,mark)
      elsif move == "4"
        set_cell(1,0,mark)
      elsif move == "5"
        set_cell(1,1,mark)
      elsif move == "6"
        set_cell(1,2,mark)
      elsif move == "7"
        set_cell(2,0,mark)
      elsif move == "8"
        set_cell(2,1,mark)
      elsif move == "9"
        set_cell(2,2,mark)
      end

      @boards << board
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

  end
end