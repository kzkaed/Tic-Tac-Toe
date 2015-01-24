require 'spec_helper'
require 'tic-tac-toe/human_player'


describe TicTacToe::HumanPlayer do
  let(:user_interface){MockUserInterface.new}
  let(:player1) { described_class.new(1,user_interface) }
  let(:player2) { described_class.new(2,user_interface) }




  it 'establishes player mark for player1' do
    expect(player1.player_number).to eq(1)
    expect(player1.mark).to eq('x')
  end


  it 'establishes player mark for player2' do
    expect(player2.player_number).to eq(2)
    expect(player2.mark).to eq('o')
  end

  it'gets player1 move from user_interface' do
   move = "1"
   user_interface.moves << move
  expect(player1.determine_move).to eq(move)
    expect(user_interface.receive_cell_number_called?).to eq(true)
  end

  it'gets player2 from user_interface' do
    move = "2"
    user_interface.moves << move
    expect(player2.determine_move).to eq(move)
    expect(user_interface.receive_cell_number_called?).to eq(true)
  end


end