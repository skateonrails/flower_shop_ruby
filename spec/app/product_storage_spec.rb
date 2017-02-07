# frozen_string_literal: true
require 'spec_helper'

describe ProductStorage do
  let(:roses) { Product.new(name: 'Roses', code: 'R12') }
  let(:lilies) { Product.new(name: 'Lilies', code: 'L09') }
  let(:tulips) { Product.new(name: 'Tulips', code: 'T58') }
  let(:products) { [roses, lilies, tulips] }
  let(:product_storage){ ProductStorage.new(products: products) }

  describe '#products' do
    it 'should return the products that are in storage' do
      expect(product_storage.products).to eq(products)
    end
  end

  describe '#find_by_code' do
    context 'with a code from a product' do
      it 'should return a product' do
        expect( product_storage.find_by_code(roses.code) ).to eq(roses)
        expect( product_storage.find_by_code(lilies.code) ).to eq(lilies)
        expect( product_storage.find_by_code(tulips.code) ).to eq(tulips)
      end
    end

    context 'with a wrong code' do
      it 'should return nil' do
        expect( product_storage.find_by_code('non_product_code') ).to be_nil
      end
    end
  end
end
