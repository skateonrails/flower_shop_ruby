# frozen_string_literal: true
require 'spec_helper'

describe OrderItem do
  let(:product) { Product.new(name: 'roses', code: 'R17') }
  let(:bundles) { [Bundle.new({}), Bundle.new({})] }
  let(:subtotal) { 100.00 }
  let(:order_item) { OrderItem.new(product: product, bundles: bundles, subtotal: subtotal)}

  describe '#product' do
    it 'should return the product of this item in order' do
      expect(order_item.product).to eq(product)
    end
  end

  describe '#bundles' do
    it 'should return the bundles of this item in order' do
      expect(order_item.bundles).to eq(bundles)
    end
  end

  describe '#subtotal' do
    it 'should return the subtotal of this item in order' do
      expect(order_item.subtotal).to eq(subtotal)
    end
  end
end
