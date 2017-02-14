# frozen_string_literal: true
require 'spec_helper'

describe ShippingService do
  let(:order_input_line) { OrderInputLine.new(value: input_line) }
  let(:roses_bundles_config) do
    [
      {value: 6.99, items_count: 5},
      {value: 12.99, items_count: 10}
    ]
  end
  let(:roses_bundles) { BundleCollectionFactory.build(roses_bundles_config) }
  let(:roses) { Product.new(name: 'Roses', code: 'R12', bundles: roses_bundles) }

  let(:lilies_bundles_config) do
    [
      {value: 9.95, items_count: 3},
      {value: 16.95, items_count: 6},
      {value: 24.95, items_count: 9}
    ]
  end
  let(:lilies_bundles) { BundleCollectionFactory.build(lilies_bundles_config) }
  let(:lilies) { Product.new(name: 'Lilies', code: 'L09', bundles: lilies_bundles) }

  let(:tulips_bundles_config) do
    [
      {value: 5.95, items_count: 3},
      {value: 9.95, items_count: 5},
      {value: 16.99, items_count: 9},
    ]
  end
  let(:tulips_bundles) { BundleCollectionFactory.build(tulips_bundles_config) }
  let(:tulips) { Product.new(name: 'Tulips', code: 'T58', bundles: tulips_bundles) }

  let(:shipping_service) { ShippingService.new(order_input_line: order_input_line, storage: ProductStorage.instance) }
  let(:stash) { shipping_service.pack }

  before(:each) do
    ProductStorage.instance.add(roses)
    ProductStorage.instance.add(lilies)
    ProductStorage.instance.add(tulips)
  end

  after(:each) do
    ProductStorage.instance.clear
  end

  describe '#pack' do
    context 'checking the required tests/outputs for this exercise' do
      context 'testing roses' do
        let(:input_line) { '10 R12' }

        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(stash.count).to eq(1)

          first_stash = stash.first
          expect(first_stash.count).to eq(1)
          expect(first_stash.bundle.items_count).to eq(10)
        end
      end

      context 'testing lilies' do
        let(:input_line) { '15 L09' }

        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(stash.count).to eq(2)

          first_stash = stash.first
          expect(first_stash.count).to eq(1)
          expect(first_stash.bundle.items_count).to eq(9)

          second_stash = stash.last
          expect(second_stash.count).to eq(1)
          expect(second_stash.bundle.items_count).to eq(6)
        end
      end

      context 'testing tulips' do
        let(:input_line) { '13 T58' }
        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(stash.count).to eq(2)

          first_stash = stash.first
          expect(first_stash.count).to eq(2)
          expect(first_stash.bundle.items_count).to eq(5)

          second_stash = stash.last
          expect(second_stash.count).to eq(1)
          expect(second_stash.bundle.items_count).to eq(3)
        end
      end
    end

    context 'when there are no bundles available' do
      let(:input_line) { '2 T58' }
      it 'should raise UnableToPackingError' do
        expect{ stash }.to raise_error(UnableToPackingError)
      end
    end
  end
end
