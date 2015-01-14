require 'tic-tac-toe/game_pieces'

module TicTacToe
  class Cell

  attr_accessor  :row , :column, :location_id, :move_value




  def initialize()

    @row = 0
    @column = 0
    @location_id = 0

    @pieces = TicTacToe::GamePieces.new
    @move_value = @pieces.empty
  end

    def place(move_value)
      return @pieces.x if move_value == 'x'
      return @pieces.o if move_value == 'o'
      return @pieces.empty if move_value == 'empty'
    end


    def clear
      return @pieces.empty
    end


  end
end