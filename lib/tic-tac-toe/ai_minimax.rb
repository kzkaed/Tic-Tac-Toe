module TicTacToe
  class AI_Minimax
      attr_accessor :current_game
    def initialize
      @current_game = nil
    end


    def get_best_move(game)

        move=''


        game_fake = game.clone
        p minimax1(game_fake) #in the form of cell number (1-9)




      return move

    end


    def minimax1(game,depth=0)
      scores = []
      moves = []
        if game.draw? #also from 'o's perspective, but neutral
          return 0
        end
        if game.end? #from perspective of maximizing player or 'o'
          return -1
        end
        possible_moves = get_possible(game.moves)#this may be an issue? cell level
        possible_moves.each do |move|

          # set_at[cell,mark] should return nil(since a set function but) but in this case return board or use creat_board
          game.create_board(move,next_player('x'))
          scores.push = minimax1(game,depth+1)
          moves.push(move)
          game.clear_at(move)
        end

        #last max value in given block, form of ["2",-10]
        #best_move = scores.max_by {|key, value| value }[0]# return key "2" , 1st element
        high_score = scores.each_with_index.max[1]
        best_move = moves[high_score]


        return best_move

    end



      def minimax2(game, player, move)
        scores = {}
        best_move = ""
        info = []

        if game.end?
          return scores.fetch(game.score)
        end
        #p best_move
        possible_moves = get_possible(game.moves)
        possible_moves.each do |move|
          game.process_turn(move,'o')
          best_move = minimax(game,next_player(player), move)
        end
        game.clear
        p "best move",best_move
        return best_move
      end

      def minimax3(game)
        return score(game) if game.end?
        scores = {}
        #best_move = scores.max_by {|key, value| value }[0]# return key "2" , 1st element
        p best_move
        high = scores.max_by { |key,value|value}[1]#return value, 2nd element
        p high

        if depth == 0
          p "depth", depth
          return best_move
        elsif depth > 0
          p "high", high
          return high
        end
        game.possible_moves
      end


      def pseudo(game, depth, player)#pseudo(game,depth,player)
        if depth == 0 # or game is a terminal game, it ends game.end?
          return #heuristic value of node[game] value = score? or move value?
        end
        if player == 'o'
          best_value = -10
          #for each child of game
            value =   pseudo(game, depth - 1, next_player(player))
            best_value = max(best_value,value)
          return best_value
        else#don't need this because this is human
          best_value = 10
          #for each child of game
            value = pseudo(game, depth - 1, next_player(player))
            best_value = max(best_value,value)
            return best_value
          end

      end

 def score(game)
        if game.winner?(@player)
          return 10
        elsif game.winner?(@next_player)
          return -10
        else
          return 0
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

      def get_possible_boards(boards)

      end

      def get_possible(moves)
        possible_moves = %w(1 2 3 4 5 6 7 8 9)
        moves.each do |move|
          possible_moves.select! {|num| num != move }
        end
        possible_moves
      end

      def print_info(info)
        puts info
      end

def hold
  if game.winner?
    scores[game.score] = move
    p scores
    if player == "o"
      p "from scores o", scores[10] if scores.has_key?(10)
      return scores[10] if scores.has_key?(10)
    else
      p "from scores x", scores[-10] if scores.has_key?(-10)
      return scores[-10] if scores.has_key?(-10)
    end
  end
  if game.draw?
    scores[game.score] = move
    return scores[0] if scores.has_key?(0)
  end
end




      def hold2
        if game.end?
          scores[game.score] = move
          p scores
          if scores.value?(10)
            p scores.fetch(10)
          elsif scores.value?(-10)
            p scores.value?(-10)
          end
          return move
        end
      end


      def next_move(move)
      move + 1
    end


  end
end