module TicTacToe
  class AI_Minimax
      attr_accessor :current_game
    def initialize
      @current_game = nil
    end


    def get_best_move(game)

        move=''


        game_fake = game.clone#don't want to alter actual game.
        p "minimax3 returns: ", minimax3(game_fake,depth=0,'o') #in the form of cell number (1-9)




      return minimax3(game_fake,depth=0,'o') #in the form of cell number (1-9)

    end




      def recursive_call(game, depth=0, player)
        minimax3(game,depth + 1, next_player(player))

      end


      def minimax3(game, depth=0, player)#3 tries later, I like this
        scores = {}
        if game.draw?
          return 0
        elsif game.winner?
          return -1 #from perspective of maxplayer or 'o' in this case, if x wins that NOT good assign LOWest value
        end

        possible_moves = get_possible(game.moves)
        possible_moves.each do |move|
          new_board_state = game.create_board(move,player)#makes new board state in game, saves it (and return it)
          p new_board_state
          scores[move] = -1 #recursive_call(game,depth+1,next_player(player))#-1 #recursive_call, so if it goes all the way to game.winner? return -1 or 0
          p scores
          game.clear_at(move)#return board to state


        end
        best_move = scores.max_by {|key, value| value }[0]# return key "2" , 1st element or move
        p "best_move", best_move
        score = scores.max_by { |key,value|value}[1]#return value, 2nd element or score max, so will return 0 over -1
        p "score" , score


        if depth == 0 #root node
          p "best move returned ",best_move
          return best_move #return move in form of "2"
        elsif depth > 0 # depth is greater than 0 or child node
          return score #return score
        end

      end


      def negamax(game,depth,player)#o
        if depth == 0
          return player * -10
        end
        possible_moves = get_possible(game.moves)
        possible_moves.each do |move|
          game.create_board(move,player)#o
          value = -negamax(game.child, depth - 1, next_player(player))
          best_value = max(best_value,value )
        end

        best_value
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




  end
end