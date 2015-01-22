require 'spec_helper'
require 'tic-tac-toe/game'

describe TicTacToe::Game do

  let(:game) { described_class.new }

  it 'has a board of 3 rows of 3 items' do

    expect(game.board).to eq([["1", "2", "3"],
                              ["4", "5", "6"],
                              ["7", "8", "9"]])
  end

  it 'places move' do
    move = 1.to_s
    board =[
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    player_mark = "x"


    expect(game.place_move(move,player_mark)).to eq(board)
  end

  it 'places move 2' do
    current_board = [
        ["x", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    game.board = current_board

    move = 2.to_s
    next_board =[
        ["x", "o", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    player_mark = "o"


    expect(game.place_move(move, player_mark)).to eq(next_board)
  end


  it 'gets a diagonal cells from board no match' do
    column = 0
    row = 0
    expect(game.get_cell(row,column)).to eq("1")

    column = 1
    row = 1
    expect(game.get_cell(row,column)).to eq("5")

    column = 2
    row = 2
    expect(game.get_cell(row,column)).to eq("9")

    expect(game.diagonal?).to eq(false)

  end

  it 'gets a diagonal cells descent from board and checks for match' do
    game.board = [["x", "2", "3"],
                  ["4", "x", "6"],
                  ["7", "8", "x"]]

    row = 0
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    row = 1
    column = 1
    expect(game.get_cell(row,column)).to eq("x")

    row = 2
    column = 2
    expect(game.get_cell(row,column)).to eq("x")

    expect(game.diagonal?).to eq(true)

  end

  it 'gets diagonal cells ascent from board and checks for match' do
    game.board = [["1", "2", "x"],
                  ["4", "x", "6"],
                  ["x", "8", "9"]]

    row = 2
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    row = 1
    column = 1
    expect(game.get_cell(row,column)).to eq("x")

    row = 0
    column = 2
    expect(game.get_cell(row,column)).to eq("x")

    expect(game.diagonal?).to eq(true)

  end


  it 'gets a row of cells from board and match' do
    game.board = [["x", "x", "x"],#row 0
                  ["o", "o", "6"],#row 1
                  ["7", "8", "9"]]#row 2
              #col 0     1    2
    row = 0
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    row = 0
    column = 1
    expect(game.get_cell(row,column)).to eq("x")

    row = 0
    column = 2
    expect(game.get_cell(row,column)).to eq("x")

    expect(game.across?).to eq(true)
  end


  it 'gets a column of cells from board and match' do
    game.board = [["x", "2", "3"],
                  ["x", "5", "6"],
                  ["x", "8", "9"]]
    row = 0
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    row = 1
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    row = 2
    column = 0
    expect(game.get_cell(row,column)).to eq("x")

    expect(game.down?).to eq(true)
  end


  it 'is a draw' do
    game.board = [["1", "2", "3"],
                  ["4", "5", "6"],
                  ["7", "8", "9"]]

    expect(game.draw?).to eq(false)

    game.board = [["x", "2", "x"],
                  ["x", "o", "6"],
                  ["o", "x", "o"]]
    #potential draw, but move not played, so unofficial
    expect(game.draw?).to eq(false)

    game.board = [["x", "o", "x"],
                  ["x", "o", "6"],
                  ["o", "x", "o"]]
    #potential draw, but move not played, so unofficial
    expect(game.draw?).to eq(false)

    game.board = [["x", "o", "x"],
                  ["x", "o", "o"],
                  ["o", "x", "o"]]

    expect(game.draw?).to eq(true)

  end


  it 'is has a win' do
    game.board = [["x", "o", "x"],
                  ["x", "x", "o"],
                  ["o", "x", "x"]]


    expect(game.winner?).to eq(true)
  end

  it 'clears board' do
    board = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
    ]
    expect(game.clear).to eq(board)
  end



  it 'has a board mapping that maps cell number to coordinates of board' do
    expect(game.board_map).to eq({
                                     "1" => [0,0],
                                     "2" => [0,1],
                                     "3" => [0,2],
                                     "4" => [1,0],
                                     "5" => [1,1],
                                     "6" => [1,2],
                                     "7" => [2,0],
                                     "8" => [2,1],
                                     "9" => [2,2]
                                 })
  end

  it 'sets a winner mark' do
    win_type = ["x", "x", "x"] #across
    expect(game.set_winning_mark(win_type)).to eq("x")
  end

  it 'sets a winner mark' do
    win_type = ["o", "o", "o"] #across
    expect(game.set_winning_mark(win_type)).to eq("o")
  end

  it 'has a winner mark and is set' do
    expect(game.winner_mark).to eq('')
    game.set_winning_mark(["x", "x", "x"])
    expect(game.winner_mark).to eq("x")
  end

  #stubs
  it 'returns game end if winner? is true' do
    allow(game).to receive(:winner?).and_return(true)
    allow(game).to receive(:draw?).and_return(false)
    expect(game.end?).to eq true
  end

  it 'returns game end if draw? is true' do
    allow(game).to receive(:winner?).and_return(false)
    allow(game).to receive(:draw?).and_return(true)
    expect(game.end?).to eq true
  end


end