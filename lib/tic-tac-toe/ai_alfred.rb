module TicTacToe

  class AI_Alfred

    #AI_Alfred is a little dumb.
    attr_accessor :current_game

    def initialize
      @current_game = nil

    end

    def get_best_move(game,mark)
      game.available_moves.pop
    end
  end
end
