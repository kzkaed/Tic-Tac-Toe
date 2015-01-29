module TicTacToe
  class AI_Minimax
    attr_accessor :current_game

    def initialize
      @current_game = nil
      @mark = ""
      @next_mark = ""

      @score
      @best_move = ""
    end


    def get_best_move(game)
      fake = game.clone
      natalie(fake, depth=0, 'o', scores={})
      return @best_move
    end

    def natalie(game, depth=0, mark, scores)
      return value(game, depth) if game.end?

      game.available_moves.each do |move|
        game.create_board(move, mark)
        scores[move] = -(natalie(game, depth + 1, next_player(mark), {}))
        game.clear_at(move)

        @best_move = max_best_move(scores)
        @score = max_score(scores)
      end

      if depth == 0
        return @best_move
      elsif depth > 0
        return @score
      end

    end

    def value(game, depth)
      if game.draw?
        return 0
      else
        return -1 * depth
      end

    end

    def max_best_move(scores)
      max_by_move(scores)
    end

    def max_score(scores)
      max_by_score(scores)
    end

    def next_player(player)
      if player == "x"
        next_player = 'o'
      else
        next_player = 'x'
      end
      next_player
    end


    #max move
    def max_move_sort(scores)
      scores.sort { |a, b| a[1] <=> b[1] }.last[0]
    end

    def max_by_move(scores)
      scores.max_by { |key, value| value }[0]
    end

    #max score
    def max_score_sort(scores)
      scores.sort { |a, b| a[1] <=> b[1] }.last[1]
    end

    def max_by_score(scores)
      scores.max_by { |key, value| key }[1]
    end

    def max(best_value,value)
      value if value > best_value
      best_value
    end

    def get_mark_sign(mark)
      if mark == 'o'
        return -1
      else
        return 1
      end
    end



  end
end