# frozen_string_literal: true
require 'spec_helper'

describe CustomerOrderItem do
  let(:product) { Product.new(name: 'roses', code: 'R17') }
  let(:count) { 100 }
  let(:bundles) { [Package.new({}), Package.new({})] }
  let(:packed_bundles_collection) { BundleCollection.new(bundles: bundles) }
  let(:subtotal) { packed_bundles_collection.inject(0){|sum, obj| sum + obj.value} }
  let(:order_item) { CustomerOrderItem.new(product: product, count: count, packed_bundles_collection: packed_bundles_collection)}

  describe '#product' do
    it 'should return the product of this item in order' do
      expect(order_item.product).to eq(product)
    end
  end

  describe '#count' do
    it 'should return the quantity of this product in order' do
      expect(order_item.count).to eq(count)
    end
  end

  describe '#packed_bundles_collection' do
    it 'should return the packed bundles of this item in order' do
      expect(order_item.packed_bundles_collection).to eq(packed_bundles_collection)
    end
  end

  describe '#subtotal' do
    it 'should return the subtotal value of this item' do
      expect(order_item.subtotal).to eq(subtotal)
    end
  end

  describe '#to_s' do
    it 'should return a formatted order_item info' do
      expect(order_item.to_s).to eq("#{count} #{product.code} $#{ValueFormatter.currency(subtotal)}\n" + packed_bundles_collection.map(&:to_s).join("\n"))
    end
  end
end
