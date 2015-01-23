module TicTacToe
  class Computer

    def initialize

    end


    def best_move(game, depth=0, best_score=[])
      return 0 if game.draw?
      return -1
    end

  end
end