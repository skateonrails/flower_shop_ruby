# frozen_string_literal: true
require 'spec_helper'

describe Product do
  let(:product_name) { 'product name' }
  let(:product_code) { 'product_code' }
  let(:bundles_config) { [{value: 20.44, itens_count: 3}] }
  let(:bundles) { BundleCollectionFactory.build(bundles_config) }
  let(:product){ Product.new(code: product_code, name: product_name, bundles: bundles) }

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

  describe '#bundles' do
    it 'should return bundles associated to the product' do
      expect(product.bundles).to eq(bundles)
    end
  end
end
