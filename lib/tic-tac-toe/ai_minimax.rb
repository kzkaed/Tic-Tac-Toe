module TicTacToe
  class AI_Minimax
    attr_accessor :best_move

    def initialize
      @best_move = ""
    end


    def get_best_move(game, mark)
      natalie(game, depth=0, mark)
      return @best_move
    end

    def natalie(game, depth=0, player)
      if game.end?
        return value(game, player, depth)
      else
        best_value = -1.0/0.0
        other_player = next_player(player)

        game.available_moves.each do |move|
          game.create_board(move, player)
          value = -natalie(game, depth + 1, other_player)
          game.clear_at(move)
          if value > best_value
            best_value = value
            @best_move = move if depth == 0
          end
        end
        return best_value
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