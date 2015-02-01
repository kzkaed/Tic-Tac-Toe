module TicTacToe

  class ColorString
    def color(text, color_code)
      "#{color_code}#{text}\033[0m"
    end

    def black(text)
      color(text, "\033[30m")
    end

    def red(text)
      color(text, "\033[31m")
    end

    def green(text)
      color(text, "\033[32m")
    end

    def yellow(text)
      color(text, "\033[33m")
    end

    def blue(text)
      color(text, "\033[34m")
    end

    def white(text)
      color(text, "\033[37m")
    end

    def magenta(text)
      color(text, "\033[35m")
    end

    def magenta_bright_blink(text)
      color(text, "\033[1;5;35m")
    end

    def magenta_bright(text)
      color(text, "\033[1;35m")
    end

    def blue_bright_blink(text)
      color(text, "\033[1;5;34m")
    end

    def black_on_white(text)
      color(text, "\033[30;47m")
    end

    def white_on_black(text)
      color(text, "\033[37;40m")
    end

    def red_on_yellow(text)
      color(text, "\033[31;43m")
    end

    def blue_on_green(text)
      color(text, "\033[34;42m")
    end

    def white_on_red(text)
      color(text, "\033[37;41m")
    end

    def black_on_cyan(text)
      color(text, "\033[30;46m")
    end

    def cyan_on_blue(text)
      color(text, "\033[36;44m")
    end

    def yellow_on_red(text)
      color(text, "\033[33;41m")
    end

    def blue_on_cyan(text)
      color(text, "\033[34;46m")
    end

    def red_on_magenta(text)
      color(text, "\033[31;45m")
    end
  end

end

