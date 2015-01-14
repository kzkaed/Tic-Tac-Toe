module TicTacToe

  class Board
    attr_accessor :matrix

    ROWS = 3
    COLUMNS = 3

    def initialize


      @matrix = [[Cell.new, Cell.new, Cell.new],
                [Cell.new, Cell.new, Cell.new],
                [Cell.new, Cell.new, Cell.new]]
      puts @matrix


    end




    def default_matrix

      #Array.new(3) { Array.new(3) {Cell.new}}

    end


  end








end