class MockGame
attr_accessor :board, :boards, :move

  def initialize
    @place_move_called = false
    @end_called = false
    @draw_called = false
    @winner_called = false

    @board = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    @boards = []
    @move
  end

  def place_move(move, mark)
    @move = move
    @mark = mark
    @place_move_called = true
    return @boards.pop
  end

  def winner?
    @winner_called = true
  end

  def draw?
    @draw_called = true
  end


  def end?
    @end_called = true
  end


#    ******* Mock expectations *******
    def place_move_called?
      return @place_move_called
    end

    def end_called?
      return @end_called
    end

  def winner_called?
    return @winner_called
  end

  def draw_called?
    return @draw_called
  end


end