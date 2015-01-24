module TicTacToe
  class AI_Minimax
      attr_accessor :current_game
    def initialize
      @current_game = nil
    end


    def get_best_move(game)



      possible_moves = %w(1 2 3 4 5 6 7 8 9)










      return move #in the form of cell number (1-9)

    end

    def minimax(game, depth=0, best_score=[])
      return if depth = 0
      return if game.end?
      return if game.draw?

      best_move = get_best_move(game)

    end

  end
end