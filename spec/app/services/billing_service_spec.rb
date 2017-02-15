# frozen_string_literal: true
require 'spec_helper'

describe BillingService do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. .. input_examples example1.md)) }
  let(:input) { File.new(filepath) }
  let(:order_input) { OrderInputFactory.build(input) }
  let(:packing_service_class) { ShippingService }
  let(:billing_service) { BillingService.new(order_input: order_input, packing_service_class: packing_service_class)}
  let(:expecting_output) do
    [
      ["10 R12 $12.99"],
      ["1 x 10 $12.99"],
      ["15 L09 $41.90"],
      ["1 x 9 $24.95"],
      ["1 x 6 $16.95"],
      ["13 T58 $25.85"],
      ["2 x 5 $9.95"],
      ["1 x 3 $5.95"]
    ].join("\n")
  end

  before(:all) do
    ProductStorageSeed.run
  end

  after(:all) do
    ProductStorage.instance.clear
  end

  describe '#create' do
    it 'should return a order' do
      customer_order = billing_service.create

      expect(customer_order.to_s).to eq(expecting_output)
    end
  end
end
