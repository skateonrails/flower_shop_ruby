# frozen_string_literal: true
require 'spec_helper'

describe OrderInput do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. input_examples example1.md)) }
  let(:input) { File.new(filepath) }
  let(:order_input) { OrderInputFactory.build(input) }

  it 'should act as array of objects that respond to product_code and quantity' do
    order_input.each do |line|
      expect(line).to respond_to(:product_code)
      expect(line).to respond_to(:quantity)
    end
  end
end
