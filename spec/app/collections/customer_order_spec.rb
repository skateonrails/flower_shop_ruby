# frozen_string_literal: true
require 'spec_helper'

describe CustomerOrder do
  let(:items_list) { [CustomerOrderItem.new({}), CustomerOrderItem.new({})] }
  let(:customer_order) { CustomerOrder.new(items: items_list)}

  describe '#items' do
    it 'should return a list of itens from order' do
      expect(customer_order.items).to eq(items_list)
    end
  end
end
