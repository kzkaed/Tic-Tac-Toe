module TicTacToe
  class AI_Minimax
      attr_accessor :current_game
    def initialize
      @current_game = nil
    end


    def get_best_move(game)

        return score(game) if game.end?
        scores = []
        moves = []









      return minimax(game,'o', "") #in the form of cell number (1-9)

    end

     def reverse_mark(mark)
       return 'o' if mark == 'x'
       return 'x' if mark == 'o'
     end

    def minimax(game, player, move)
      scores = []
      fake_game = game.clone
      fake_game.process_turn(move,player)#move,start with o
      p move
      p player
      p game.end?
      p game.boards
      p game.moves
      p game.score
      if game.end?
        scores[] << game.score
        return move
      end
      if player == "x"
        next_player = 'o'
      else
        next_player = 'x'
      end

      best_move = "2"
      possible_moves = %w(1 2 3 4 5 6 7 8 9)

      possible_moves.each do |move|
        best_move  = minimax(game,next_player,move)

        if best_move == nil ||  score[index] < score[index + 1]
          best_move = move
        end
      end
      game.clear

      return best_move
    end

    def next_move(move)
      move = move + 1
    end

  end
end