module TicTacToe
  class Console


    def out(value)
      puts value
    end

    def in
      gets
    end

    def format_out(output_array)
        output_string = ""
      output_array.each do |row|
        output_string << ' ' + row + ' '
      end
      output_string
    end

  end
end
