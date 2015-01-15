class MockPlayer
  attr_accessor :moves
  def initialize
    @make_move_called = false
    @moves = []
    @mark = 'x'

  end

def make_move(move)
  @make_move_called = true
  @moves << move
end

#######Mocks

  def make_move_called?
    return @make_move_called
  end

end