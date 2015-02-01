class MockPlayer
  attr_accessor :moves, :player_number, :boards, :current_board, :marks, :mark, :game

  def initialize(player_number)
    @player_number = player_number
    @get_move_called = false
    @player_mark_called = false

    @move = ""
    @moves = []
    @boards = []
    @current_board = []
    @marks = []
    @mark = ""
    @game
  end


  def determine_move(game,mark)
    @game = game
    @get_move_called = true
    return @moves.pop
  end

  def player_mark
    @mark = 'x' if player_number == 1
    @mark = 'o' if player_number == 2

    @player_mark_called = true
    return @marks.pop
  end


#    ******* Mock expectations *******

  def get_move_called?
    return @get_move_called
  end

  def player_mark_called?
    return @player_mark_called
  end
end