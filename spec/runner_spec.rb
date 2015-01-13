require 'spec_helper'
require 'tic-tac-toe/runner.rb'
require 'mocks/mock_game'


describe TicTacToe::Runner do

  let!(:game) { MockGame.new }
  let(:runner) { described_class.new (game)}

  it 'creates a game' do
    expect(runner.game).to eq(game)


  end
end