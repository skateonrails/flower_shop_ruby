# frozen_string_literal: true
# CustomerOrder represents the order from a customer,
# with it's items
class CustomerOrder
  attr_reader :items

  def initialize(args)
    @items = args[:items]
  end
end
