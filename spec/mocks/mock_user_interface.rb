class MockUserInterface

  attr_accessor :messages
  def initialize
    @prepare_called = false
    @out_called = false
    @out_board_called = false
    @out_board_cell_numbers_called = false

    @game
    @game_string = ""
    @messages = []
  end

  def prepare
    @prepare_called = true
  end

  def display_game_result()
    @display_game_result_called = true
  end

  def out (messages)
    @out_called = true
    @messages << messages
  end

  def out_board(game)
    @game = game
    @out_board_called = true
  end

  def out_board_cell_numbers
    @out_board_cell_numbers_called = true
  end

#    ******* Mock expectations *******


  def prepare_called?
    return @prepare_called
  end

  def display_game_result_called?
    return @display_game_result_called
  end

  def out_called?
    return @out_called
  end

  def out_board_called?
    return @out_board_called
  end

  def out_board_cell_numbers_called?
    return @out_board_cell_numbers_called
  end

end
