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
        p "best_move: #{@best_move}"
        @score = max_score(scores)
        p "score: #{@score}"
        p scores
        #{"1"=>3, "2"=>0, "3"=>1, "4"=>3, "6"=>3} I want "3"=>1 if depth == 1 then return scores
        if depth == 1
          p "depth in" , depth
          p "scores in" , scores
        end
      end
      if depth == 0
        return @best_move
      elsif depth > 0
        return @score
      end

    end

    def value(game, depth)
      p "depth: #{depth}"
      if game.draw?
        return 0 #always evaluate to 0 *depth
      else
        return -1 * depth#use depth gives {"1"=>3, "2"=>0, "3"=>1, "4"=>3, "6"=>3}
        #need that "3"=>1
      end

    end



    def max_select_score(scores)
      max_number = scores.values.max
      scores.select { |k, v| v == max_number }.keys
    end

    def max_sort_move(scores)
      scores.sort { |a, b| a[1] <=> b[1] }.last[0]
    end

    def max_sort_score(scores)
      scores.sort { |a, b| a[1] <=> b[1] }.last[1]
    end

    def max_by_score(scores)
      scores.max_by { |key, value| key }[1]
      #max by is O(n)
    end

    def max_by_move(scores)
      scores.max_by { |key, value| value }[0]
    end

    def max_score(scores)
      #random selection of best maxes
      max_sort_score(scores)
      #max_by_score(scores)
    end

    def max_best_move(scores)
      max_sort_move(scores)
      #max_by_move(scores)
    end

    def negamax(game, depth, player) #o
      if depth == 0
        return player * -1
      end
      game.available_moves.each do |move|
        game.create_board(move, player) #o
        value = -negamax(game.child, depth - 1, next_player(player))
        best_value = max(best_value, value)
      end

      best_value
    end



    def pseudo(game, depth, player) #pseudo(game,depth,player)
      if depth == 0 # or game is a terminal game, it ends game.end?
        return  #heuristic value of node[game] value = score? -1,0,1
      else
        if player == 'o'
          best_value = -1.0/0
          #for each child of game
          value = pseudo(game, depth - 1, next_player(player))
          best_value = max(best_value, value)
          return best_value
        else #other player
          best_value = 1.0/0
          #for each child of game
          value = pseudo(game, depth - 1, next_player(player))
          best_value = max(best_value, value)
          return best_value
        end
      end

    end


    def reverse_mark(mark)
      return 'o' if mark == 'x'
      return 'x' if mark == 'o'
    end

    def next_player(player)
      if player == "x"
        next_player = 'o'
      else
        next_player = 'x'
      end
      next_player
    end

    def infinity(wish)

      #(0.0).infinite?        #=> nil
      #(-1.0/0.0).infinite?   #=> -1
      #(+1.0/0.0).infinite?   #=> 1
      neg_infinity = -1.0/0.0
      INFINITY
    end


  end
end