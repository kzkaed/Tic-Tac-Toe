module TicTacToe
  class Presenter
    attr_accessor :color_string

    def initialize(color_string)
      @color_string = color_string
    end

    def compile_result(mark1, mark2, game)

      player = set_winning_player(mark1, mark2, game.winner_mark)
      mark_color_string = set_mark_color(mark1,mark2, game.winner_mark)

      result = {}
      if game.winner?
        sound_win
        result[:winner] = color_string.blue_bright_blink("A Win!")
        result[:player] = "#{color_string.magenta_bright(player)} is the winner with #{mark_color_string}"
        #result[:win_mark] = game.winner_mark

      end
      if game.draw?
        sound_draw
        result[:draw] = "#{color_string.blue_bright_blink("MEOW")}, Cat's Game!"
      end
      result
    end

    private

    def set_mark_color (mark1, mark2, winner_mark)
      if winner_mark == mark1
        mark_color_string = color_string.black_on_cyan(winner_mark)
      elsif winner_mark == mark2
        mark_color_string = color_string.white_on_red(winner_mark)
      end
      mark_color_string
    end

    def set_winning_player(mark1, mark2, winner_mark)
      return 'Player 1' if winner_mark == mark1
      return 'Player 2' if winner_mark == mark2
    end

    def sound_draw
      `say 'meow, cat's game`
    end

    def sound_win
      `say 'bee's knees, a win`
    end

  end
end
