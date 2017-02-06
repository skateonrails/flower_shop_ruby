# frozen_string_literal: true
# CustomerOrder represents the order from a customer,
# with it's total value, products and bundles
class CustomerOrder
  attr_reader :items, :total

  def initialize(args)
    @items = args[:items]
    @total = args[:total]
  end
end
