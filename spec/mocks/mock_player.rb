class MockPlayer
  attr_accessor :moves, :player_number, :boards, :current_board
  def initialize(player_number)
    @player_number = player_number
    @get_move_called = false

    @move = ""
    @moves = []
    @boards = []
    @current_board = []

  end


  def get_move
    @get_move_called = true
    return @moves.pop
  end


#    ******* Mock expectations *******

   def get_move_called?
    return @get_move_called
  end
end