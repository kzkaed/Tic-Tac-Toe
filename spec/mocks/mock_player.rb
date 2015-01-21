class MockPlayer
  attr_accessor :moves, :player_number, :boards, :current_board, :mark
  def initialize(player_number)
    @player_number = player_number
    @get_move_called = false
    @player_mark_called = false

    @move = ""
    @moves = []
    @boards = []
    @current_board = []
    @mark = []
  end


  def get_move
    @get_move_called = true
    return @moves.pop
  end

  def player_mark
    @player_mark_called = true
    return @mark.pop
  end



#    ******* Mock expectations *******

   def get_move_called?
    return @get_move_called
   end

  def player_mark_called?
    return @player_mark_called
  end
end