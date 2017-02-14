# frozen_string_literal: true
require 'spec_helper'

describe CustomerOrderItem do
  let(:product) { Product.new(name: 'roses', code: 'R17') }
  let(:bundle) { Bundle.new({value: 10.33, items_count: 5}) }
  let(:count) { 100 }
  let(:order_item) { CustomerOrderItem.new(product: product, bundle: bundle, count: count)}

  describe '#product' do
    it 'should return the product of this item in order' do
      expect(order_item.product).to eq(product)
    end
  end

  describe '#bundle' do
    it 'should return the bundles of this item in order' do
      expect(order_item.bundle).to eq(bundle)
    end
  end

  describe '#count' do
    it 'should return the count of bundles in order' do
      expect(order_item.count).to eq(count)
    end
  end

  describe '#subtotal' do
    it 'should return the subtotal value of this item' do
      expect(order_item.subtotal).to eq(count * bundle.value)
    end
  end
end
