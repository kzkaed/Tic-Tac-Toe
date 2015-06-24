module TicTacToe
  class Presenter
    attr_accessor :color_string, :totals_o, :totals_x, :audio


    def initialize(color_string)
      @color_string = color_string
      @totals_o = 0
      @totals_x = 0
    end

    def compile_result(mark1, mark2, game)
      win_mark = get_win_mark(game.board)
      player = set_winning_player(mark1, mark2, win_mark)
      mark_color_string = set_mark_color(mark1, mark2, win_mark)

      result = {}
      if game.winner?
        result[:winner] = color_string.blue_bright_blink("A Win!")
        result[:player] = "#{color_string.magenta_bright(player)} is the winner with #{mark_color_string}"
      end
      if game.draw?
        result[:draw] = "#{color_string.blue_bright_blink("MEOW")}, Cat's Game!"
      end
      return result
    end

    def score_result(game)
      win_mark = get_win_mark(game.board)
      if game.winner? && win_mark == 'x'
        @totals_x = @totals_x + 10
      elsif game.winner? && win_mark == 'o'
        @totals_o = @totals_o + 10
      else
        @totals_x = @totals_x + 0
        @totals_o = @totals_o + 0
      end

      return [@totals_x,@totals_o]
    end

    def get_win_mark(board)
      x_count = 0
      o_count = 0
      reduced = board.flatten.keep_if { |cell| cell == 'x' || cell == "o"}
      reduced.each do |cell|
        if cell == 'x'
          x_count = x_count + 1
        else
          o_count = o_count + 1
        end
      end
      return 'x' if x_count > o_count
      return 'o'
    end

    private
    def set_mark_color (mark1, mark2, winner_mark)
      if winner_mark == mark1
        mark_color_string = color_string.black_on_cyan(winner_mark)
      elsif winner_mark == mark2
        mark_color_string = color_string.white_on_red(winner_mark)
      end
      return mark_color_string
    end

    def set_winning_player(mark1, mark2, winner_mark)
      return 'Player 1' if winner_mark == mark1
      return 'Player 2' if winner_mark == mark2
    end



  end
end
