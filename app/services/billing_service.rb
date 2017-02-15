# frozen_string_literal: true
# BillingService is responsible to get a OrderInput and transform
# it to a CustomerOrder, doing the packing of bundles
class BillingService
  def initialize(args)
    @order_input = args[:order_input]
    @packing_service_class = args[:packing_service_class]
  end

  def create
    items = []
    order_input.each do |order_input_line|
      items << shipping_service(order_input_line).pack
    end

    CustomerOrder.new(items: items)
  end

  private

  attr_reader :order_input, :packing_service_class

  def shipping_service(order_input_line)
    packing_service_class.new(order_input_line: order_input_line)
  end
end
