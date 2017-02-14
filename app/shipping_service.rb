# frozen_string_literal: true
require 'ostruct'
# ShippingService is responsible for getting the order_input_line,
# find the products and generate the order_item with the possible bundles
class ShippingService
  def initialize(args)
    init_stash
    @storage = args[:storage]
    @order_line = args[:order_input_line]
  end

  # :reek:TooManyStatements
  def pack
    valid_bundles = valid_packing_bundles.dup

    begin
      pack_bundles(valid_bundles)
      stash
    rescue PackingError
      init_stash
      valid_bundles.pop
      retry if valid_bundles.any?
      raise UnableToPackingError
    end
  end

  private

  attr_accessor :order_line, :stash, :storage

  def init_stash
    @stash = []
  end

  def order_quantity
    order_line.quantity
  end

  def product
    storage.find_by_code(order_line.product_code)
  end

  def product_bundles
    product.bundles
  end

  def valid_packing_bundles(items_quantity = order_quantity)
    product_bundles.available_bundles_for_packing(items_quantity)
  end

  def add_to_stash(args)
    stash << OpenStruct.new(args)
  end

  def decrease_count_from_last_stash
    last_stash.count -= 1
  end

  def last_stash_count
    last_stash.count
  end

  def last_stash
    stash.last
  end

  # :reek:TooManyStatements
  def pack_bundles(valid_bundles, quantity = order_quantity)
    raise PackingError if valid_bundles.empty?
    first_bundle = valid_bundles.first
    last_bundle = valid_bundles.last

    first_bundle_count = first_bundle.items_count
    last_bundle_count = last_bundle.items_count

    packed_products_count = quantity / last_bundle_count
    unpacked_products_quantity = quantity % last_bundle_count

    add_to_stash(count: packed_products_count, bundle: last_bundle)
    return if unpacked_products_quantity.zero?

    if unpacked_products_quantity >= first_bundle_count
      valid_bundles = valid_packing_bundles(unpacked_products_quantity)
    else
      PackingError if packed_products_count == 1 || valid_bundles.size == 1
      unpacked_products_quantity = adjust_previous_stash(valid_bundles, quantity)
    end

    pack_bundles(valid_bundles, unpacked_products_quantity)
  end

  def adjust_previous_stash(valid_bundles, quantity)
    decrease_count_from_last_stash
    last_bundle = valid_bundles.pop
    quantity - last_stash_count * last_bundle.items_count
  end
end
