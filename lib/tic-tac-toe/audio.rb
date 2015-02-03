module TicTacToe
  class Audio

    def sound_draw
      begin
        `say 'meow, cat's game`
      rescue
        false
      end
      true
    end

    def sound_win
      `say 'bee's knees, a win`
      true
    end

  end
end
