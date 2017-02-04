# frozen_string_literal: true
require 'spec_helper'

describe Product do
  let(:product_name) { 'product name' }
  let(:product_code) { 'product_code' }
  let(:product){ Product.new(code: product_code, name: product_name) }

  describe '#name' do
    it 'should return name of the product' do
      expect(product.name).to eq(product_name)
    end
  end

  describe '#code' do
    it 'should return code of the product' do
      expect(product.code).to eq(product_code)
    end
  end
end
