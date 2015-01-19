class MockUserInterface

  attr_accessor :content_holder, :board, :moves
  def initialize
    @prepare_called = false
    @output_called = false
    @display_board_called = false
    @display_board_cell_numbers_called = false
    @input_called = false

    @board
    @board_string = ""
    @content_holder = []
    @moves = []
  end

  def prepare
    @prepare_called = true
  end

  def display_board_cell_numbers
    @display_board_cell_numbers_called = true
  end

  def display_board(board)
    @board = board
    @display_board_called = true
  end


  def output (content)
    @output_called = true
    @content_holder << content
  end


  def display_game_result()
    @display_game_result_called = true
  end


  def in_move
    @in_move_called = true
    @moves.pop
  end

  def input
    @input_called = true

  end

#    ******* Mock expectations *******


  def prepare_called?
    return @prepare_called
  end

  def display_game_result_called?
    return @display_game_result_called
  end

  def output_called?
    return @output_called
  end

  def display_board_called?
    return @display_board_called
  end

  def display_board_cell_numbers_called?
    return @display_board_cell_numbers_called
  end

  def input
    return @input_called
  end
end
