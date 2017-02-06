# frozen_string_literal: true
# OrderItem represents a product and it's bundles
# inside an order, with it's subtotal
class OrderItem
  attr_reader :product, :bundles, :subtotal

  def initialize(args)
    @product = args[:product]
    @bundles = args[:bundles]
    @subtotal = args[:subtotal]
  end
end
