module TicTacToe
  class AI_Minimax
    attr_accessor :current_game, :this_mark, :best_move

    def initialize
      @current_game = nil
      @this_mark = 'o'

      @score
      @best_move = ""
      @scores = {}
    end


    def get_best_move(game,mark)
      fake = game.clone
      natalie(fake, depth=0, mark, scores={})
      puts "scores from top #{@scores}"
      puts "best_move from top #{@best_move}"
      return @best_move
    end




    def natalie(game, depth=0,player, scores)
      if game.end?
        return value(game, player, depth)
      else
        other_player = next_player(player)
        if player == 'o'
          puts "in player o", player
          test_value = -10
          game.available_moves.each do |move|

            game.create_board(move, player)
            score = -natalie(game,  depth + 1,other_player, {})
            @scores[move] = score
            game.clear_at(move)


            if score > test_value
              puts "#{score} > #{test_value}? pick score to be max_value"
              test_value = score
              puts "max_value is now #{test_value}"

              if depth == 0
                @best_move = move

                puts "#{depth}after assignment::player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
              end

              puts "#{depth}: player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
            end

          end
          return test_value
        else
          puts "in player x", player
          test_value = -10
          game.available_moves.each do |move|

            game.create_board(move, player)
            score = -natalie(game,  depth + 1,other_player, {})
            @scores[move] = score
            game.clear_at(move)


            if score > test_value
              puts "#{score} > #{test_value}? pick score to be max_value"
              test_value = score
              puts "max_value is now #{test_value}"

              if depth == 0
                @best_move = move

                puts "#{depth}after assignment::player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
              end

              puts "#{depth}: player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
            end

          end

          return test_value
        end

      end
    end

    def natalie_hold(game, depth=0,player, scores)
      if game.end?
        return value(game, player, depth)
      else
        test_value = -10
        other_player = next_player(player)

        game.available_moves.each do |move|

          game.create_board(move, player)
          score = -natalie(game,  depth + 1,other_player, {})
          @scores[move] = score
          game.clear_at(move)


            if score > test_value
              puts "#{score} > #{test_value}? pick score to be max_value"
              test_value = score
              puts "max_value is now #{test_value}"

              if depth == 0
                @best_move = move

                puts "#{depth}after assignment::player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
              end

              puts "#{depth}: player:#{player} scores#{@scores} score#{score} best_move#{move.inspect}"
            end

          end

        test_value
      end
    end


    def mildred(game, depth, player)

    end


    def value(game, player, depth)
      if game.winner == player
        puts "game winner:#{game.winner} player: #{player}"
        return 1 * depth
      elsif game.winner == next_player(player)
        puts "game winner:#{game.winner} player: #{player}"
        return -1 * depth
      else
        return 0
      end

    end

    def value2(game, player, depth)
      if game.draw?
        return 0
      else
        return -1 * depth * change_to_integer_representation(player, game)   #   #double negations
      end
    end



    def change_to_integer_representation(player,game)#x or o
      if player != game.winner
        return -1
      elsif player == game.winner
        return 1
      end
    end


    def natalie2(game, depth=9, mark, scores)
      return value(game, depth,mark) if game.end?

      game.available_moves.each do |move|
        game.create_board(move, mark)
        scores[move] = -(natalie(game, depth - 1, next_player(mark), {}))
        game.clear_at(move)

        @best_move = max_best_move(scores)
        @score = max_score(scores)
      end

      if depth == 9
        puts "#{depth}: player:#{mark} scores#{scores} score#{@score} best_move#{@best_move}"
        return @best_move
      elsif depth < 9
        puts "#{depth}: player:#{mark} scores#{scores} score#{@score} best_move#{@best_move}"
        return @score
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

    def max_best_move(scores)
      max_by_move(scores)
    end

    def max_score(scores)
      max_by_score(scores)
    end

    def min_move(scores)
      scores.sort {|a, b| b[1] <=> a[1] }.last[0]
    end

    def min_of_score(scores)
      scores.sort {|a, b| b[1] <=> a[1] }.last[1]
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




end
end