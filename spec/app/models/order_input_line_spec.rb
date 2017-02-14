# frozen_string_literal: true
require 'spec_helper'

describe OrderInputLine do
  let(:input) { '10 R15' }
  let(:order_input_line) { OrderInputLine.new(value: input) }

  context 'with invalid input value' do
    let(:input) { 'an invalid input value' }

    it 'should raise a exception' do
      expect{ order_input_line }.to raise_error(InvalidInputLineException)
    end
  end

  describe '#quantity' do
    it 'should return the quantity value of itens from input line' do
      expect(order_input_line.quantity).to eq(10)
    end
  end

  describe '#product_code' do
    it 'should return the product code from input line' do
      expect(order_input_line.product_code).to eq('R15')
    end
  end
end
