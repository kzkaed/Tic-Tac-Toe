module TicTacToe

class Player

def initialize(player_number)
@player_number = player_number
end

  def place_move
    return 'x' if @player_number == 1
    return 'o' if @player_number == 2
  end

end
end