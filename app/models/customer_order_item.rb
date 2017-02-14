# frozen_string_literal: true
# CustomerOrderItem represents a product and it's bundles
# inside an order, with it's subtotal
class CustomerOrderItem
  attr_reader :product, :bundles, :subtotal

  def initialize(args)
    @product = args[:product]
    @bundles = args[:bundles]
    @subtotal = args[:subtotal]
  end
end
