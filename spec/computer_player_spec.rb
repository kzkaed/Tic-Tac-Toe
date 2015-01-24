require 'spec_helper'
  require 'tic-tac-toe/computer_player'
require 'tic-tac-toe/ai_alfred'

  describe TicTacToe::ComputerPlayer do

    let(:ai) {TicTacToe::AI_Alfred.new}
    let(:computer_player) {described_class.new(2,ai)}

    it 'establishes player mark for player' do
      expect(computer_player.player_number).to eq(2)
      expect(computer_player.mark).to eq('o')
    end

  end