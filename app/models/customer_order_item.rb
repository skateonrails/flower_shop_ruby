# frozen_string_literal: true
# CustomerOrderItem represents a product and it's bundles
# inside an order, with it's subtotal
class CustomerOrderItem
  attr_reader :product, :count, :packed_bundles

  def initialize(args)
    @product = args[:product]
    @count = args[:count].to_i
    @packed_bundles = args[:packed_bundles]
  end

  def subtotal
    value = packed_bundles.inject(0) do |memo, packed_bundle|
      memo + packed_bundle.value
    end

    value.round(2)
  end
end
