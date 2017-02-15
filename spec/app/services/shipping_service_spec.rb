# frozen_string_literal: true
require 'spec_helper'

describe ShippingService do
  let(:order_input_line) { OrderInputLine.new(value: input_line) }
  let(:shipping_service) { ShippingService.new(order_input_line: order_input_line) }
  let(:order_item) { shipping_service.pack }

  before(:all) do
    ProductStorageSeed.run
  end

  after(:all) do
    ProductStorage.instance.clear
  end

  describe '#pack' do
    context 'checking the required tests/outputs for this exercise' do
      context 'testing roses' do
        let(:input_line) { '10 R12' }

        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(order_item.product.code).to eq('R12')
          expect(order_item.count).to eq(10)
          expect(order_item.subtotal).to eq(12.99)

          packed_bundles = order_item.packed_bundles
          expect(packed_bundles.size).to eq(1)
          expect(packed_bundles.first.count).to eq(1)
          expect(packed_bundles.first.bundle.items_count).to eq(10)
        end
      end

      context 'testing lilies' do
        let(:input_line) { '15 L09' }

        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(order_item.product.code).to eq('L09')
          expect(order_item.count).to eq(15)
          expect(order_item.subtotal).to eq(41.90)

          packed_bundles = order_item.packed_bundles
          expect(packed_bundles.size).to eq(2)
          expect(packed_bundles.first.count).to eq(1)
          expect(packed_bundles.first.bundle.items_count).to eq(9)

          expect(packed_bundles.last.count).to eq(1)
          expect(packed_bundles.last.bundle.items_count).to eq(6)
        end
      end

      context 'testing tulips' do
        let(:input_line) { '13 T58' }
        it 'should contain the minimal number of bundles to fulfill the shipment requirements' do
          expect(order_item.product.code).to eq('T58')
          expect(order_item.count).to eq(13)
          expect(order_item.subtotal).to eq(25.85)

          packed_bundles = order_item.packed_bundles
          expect(packed_bundles.size).to eq(2)
          expect(packed_bundles.first.count).to eq(2)
          expect(packed_bundles.first.bundle.items_count).to eq(5)

          expect(packed_bundles.last.count).to eq(1)
          expect(packed_bundles.last.bundle.items_count).to eq(3)
        end
      end
    end

    context 'when there are no bundles available' do
      let(:input_line) { '2 T58' }
      it 'should raise UnableToPackingError' do
        expect{ order_item }.to raise_error(UnableToPackingError)
      end
    end
  end
end
