class MockUserInterface

  attr_accessor :content_holder, :board, :moves, :results, :play_again
  def initialize
    @display_board_called = false
    @receive_cell_number_called = false
    @display_game_result_called = false
    @play_again_called = false

    @play_again = false
    @board
    @board_string = ""
    @content_holder = []
    @moves = []
    @results = []
  end

  def display_board(board)
    @board = board
    @display_board_called = true
  end

  def receive_cell_number
    @receive_cell_number_called = true
    @moves.pop
  end

  def display_game_result(result)
    @results << result
    @display_game_result_called = true
  end

  def play_again?
    @play_again_called = true
    play_again
  end

#    ******* Mock expectations *******

  def display_board_called?
    return @display_board_called
  end

  def receive_cell_number_called?
    return @receive_cell_number_called
  end

  def display_game_result_called?
    return @display_game_result_called
  end

  def play_again_called?
    return @play_again_called
  end
end
