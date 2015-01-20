class MockUserInterface

  attr_accessor :content_holder, :board, :moves
  def initialize
    @output_called = false
    @display_board_called = false
    @input_called = false
    @receive_cell_number_called = false

    @board
    @board_string = ""
    @content_holder = []
    @moves = []
  end

  def display_board(board)
    @board = board
    @display_board_called = true
  end

  def receive_cell_number
    @receive_cell_number_called = true
    @moves.pop
  end

  def output (content)
    @output_called = true
    @content_holder << content
  end

  def input
    @input_called = true
  end

  def display_game_result()
    @display_game_result_called = true
  end

#    ******* Mock expectations *******

  def display_board_called?
    return @display_board_called
  end

  def receive_cell_number_called?
    return @receive_cell_number_called
  end

  def output_called?
    return @output_called
  end

  def input
    return @input_called
  end

  def display_game_result_called?
    return @display_game_result_called
  end
end
