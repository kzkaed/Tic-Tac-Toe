require 'tic-tac-toe/cell.rb'
module TicTacToe

  class Board
    attr_accessor :matrix

    ROWS = 3
    COLUMNS = 3

    def initialize


      @matrix = [[Cell.new, Cell.new, Cell.new],
                [Cell.new, Cell.new, Cell.new],
                [Cell.new, Cell.new, Cell.new]]
      #Array.new(3) { Array.new(3) {Cell.new}}
      #puts @matrix


    end





  end








end