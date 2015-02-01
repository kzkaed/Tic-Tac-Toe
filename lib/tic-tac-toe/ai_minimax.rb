module TicTacToe
  class AI_Minimax
    attr_accessor :best_move

    def initialize
      @best_move = ""
    end


    def get_best_move(game, mark)
      natalie(game, depth=0, mark,)
      return @best_move
    end


    def natalie(game, depth=0, player)
      if game.end?
        return value(game, player, depth)

      else
        test_value = -10
        other_player = next_player(player)

        game.available_moves.each do |move|
          game.create_board(move, player)
          score = -natalie(game, depth + 1, other_player)
          game.clear_at(move)
          if score > test_value
            test_value = score
            if depth == 0
              @best_move = move
            end
          end
        end
        return test_value
      end
    end

    def value(game, player, depth)
      if game.draw?
        return 0
      else
        return -1 * depth * change_to_integer_representation(player, game)
      end
    end


    def change_to_integer_representation(player, game)
      if game.winner == player
        return -1
      elsif game.winner == next_player(player)
        return 1
      end
    end


    def next_player(player)
      if player == "x"
        next_player = 'o'
      else
        next_player = 'x'
      end
      next_player
    end

  end
end