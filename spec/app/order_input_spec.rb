# frozen_string_literal: true
require 'spec_helper'

describe OrderInput do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. input_examples example1.md)) }
  let(:input) { File.new(filepath) }
  let(:order_input) { OrderInput.new(input: input) }

  describe '#input' do
    it 'should return the input from an order' do
      expect(order_input.input).to eq(input)
    end
  end

  describe '#lines' do
    it 'should return an array of objects that respond to product_code and quantity' do
      expect(order_input.lines).to be_kind_of(Array)
      order_input.lines.each do |line|
        expect(line).to respond_to(:product_code)
        expect(line).to respond_to(:quantity)
      end
    end
  end
end
