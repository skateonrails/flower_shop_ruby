# frozen_string_literal: true
require 'spec_helper'

describe OrderInput do
  let(:input) { '10 R15' }
  let(:order_input) { OrderInput.new(input: input) }

  describe '#input' do
    it 'should return the input from an order' do
      expect(order_input.input).to eq(input)
    end
  end
end
