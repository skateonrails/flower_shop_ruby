# frozen_string_literal: true
# CustomerOrderItem represents a product and it's bundles
# inside an order, with it's subtotal
class CustomerOrderItem
  attr_reader :product, :count, :packed_bundles_collection

  def initialize(args)
    @product = args[:product]
    @count = args[:count].to_i
    @packed_bundles_collection = args[:packed_bundles_collection] || []
  end

  def to_s
    string = "#{count} #{product} $#{ValueFormatter.currency(subtotal)}\n"
    string + packed_bundles_collection.to_s
  end

  def subtotal
    value = packed_bundles_collection.inject(0) do |memo, packed_bundle|
      memo + packed_bundle.value
    end

    value.round(2)
  end
end
