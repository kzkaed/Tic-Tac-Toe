class MockPlayer
  attr_accessor :moves
  def initialize
    @place_move_called = false
    @moves = []
    @mark = 'x'

  end

def place_move(move)
  @place_move_called = true
  @moves << move
end

#    ******* Mock expectations *******

  def place_move_called?
    return @place_move_called
  end

end