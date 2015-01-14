module TicTacToe
  class GamePieces

    attr_reader :x, :o, :empty

    X = 'x'
    O = 'o'
    EMPTY = ' '

    def initialize
      @x = X
      @o = O
      @empty = EMPTY
    end


  end
end