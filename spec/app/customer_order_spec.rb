# frozen_string_literal: true
require 'spec_helper'

describe CustomerOrder do
  let(:items_list) { [1,2,3] }
  let(:order_total) { 30.33 }
  let(:customer_order) { CustomerOrder.new(items: items_list, total: order_total)}

  describe '#items' do
    it 'should return a list of itens from order' do
      expect(customer_order.items).to eq(items_list)
    end
  end

  describe '#total' do
    it 'should return the total value of the order' do
      expect(customer_order.total).to eq(order_total)
    end
  end
end
