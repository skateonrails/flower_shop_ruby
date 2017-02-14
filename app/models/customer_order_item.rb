# frozen_string_literal: true
# CustomerOrderItem represents a product and it's bundles
# inside an order, with it's subtotal
class CustomerOrderItem
  attr_reader :product, :bundle, :count

  def initialize(args)
    @product = args[:product]
    @bundle = args[:bundle]
    @count = args[:count].to_i
  end

  def subtotal
    bundle.value * count
  end
end
