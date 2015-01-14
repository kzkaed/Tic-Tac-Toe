require 'spec_helper'
require 'tic-tac-toe/cell.rb'

describe TicTacToe::Cell do

  let(:cell){described_class.new}


  it 'should contain a coordinate or location id' do
    expect(cell.move_value).to eq(' ')
    expect(cell.column).to be(0)
    expect(cell.row).to be(0)
    expect(cell.location_id).to be(0)

  end

  it 'should place a x, o or empty' do
    expect(cell.place('x')).to eq('x')
    expect(cell.place('o')).to eq('o')
    expect(cell.place('empty')).to eq(' ')

  end

  it 'should clear when asked' do
    expect(cell.clear).to eq(' ')
  end


end