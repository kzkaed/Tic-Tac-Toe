module TicTacToe

  class AI_Alfred

    #AI_Alfred is a little dumb.
    attr_accessor :current_game

    def initialize
      @current_game = nil
    end

    def get_best_move(game)
      @current_game = game
      possible_moves = %w(1 2 3 4 5 6 7 8 9)
      fake_game = current_game.clone
      fake_game.moves.each do |move| #1
        possible_moves.select! { |num| num!=move }
      end
      possible_moves.pop
    end

  end
end
