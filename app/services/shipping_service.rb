# frozen_string_literal: true
# ShippingService is responsible for getting the order_input_line,
# find the products and generate the order_item with the possible bundles
class ShippingService
  def initialize(args)
    init_bundle_package
    @order_line = args[:order_input_line]
  end

  # :reek:TooManyStatements
  def pack
    valid_bundles = valid_packing_bundles.dup

    begin
      pack_bundles(valid_bundles)
      create_order_item
    rescue PackingError
      init_bundle_package
      valid_bundles.pop
      retry if valid_bundles.any?
      raise UnableToPackingError
    end
  end

  private

  attr_accessor :order_line, :bundle_package

  def init_bundle_package
    @bundle_package = BundleCollection.new
  end

  def order_quantity
    order_line.quantity
  end

  def product
    ProductStorage.instance.find_by_code(order_line.product_code)
  end

  def product_bundles
    product.bundles
  end

  def valid_packing_bundles(items_quantity = order_quantity)
    product_bundles.available_bundles_for_packing(items_quantity)
  end

  def create_order_item
    CustomerOrderItem.new(product: product,
                          count: order_quantity,
                          packed_bundles_collection: bundle_package)
  end

  def add_to_bundle_package(args)
    bundle_package << Package.new(args)
  end

  def last_bundle_package
    bundle_package.last
  end

  def decrease_count_from_last_bundle_package
    last_bundle_package.decrease_count
  end

  def last_bundle_package_count
    last_bundle_package.count
  end

  # rubocop:disable Metrics/LineLength
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  # :reek:TooManyStatements
  def pack_bundles(valid_bundles, quantity = order_quantity)
    raise PackingError if valid_bundles.empty?
    first_bundle = valid_bundles.first
    last_bundle = valid_bundles.last

    first_bundle_count = first_bundle.items_count
    last_bundle_count = last_bundle.items_count

    packed_products_count = quantity / last_bundle_count
    unpacked_products_quantity = quantity % last_bundle_count

    add_to_bundle_package(count: packed_products_count, bundle: last_bundle)
    return if unpacked_products_quantity.zero?

    if unpacked_products_quantity >= first_bundle_count
      valid_bundles = valid_packing_bundles(unpacked_products_quantity)
    else
      PackingError if packed_products_count == 1 || valid_bundles.size == 1
      unpacked_products_quantity = adjust_previous_bundle_package(valid_bundles, quantity)
    end

    pack_bundles(valid_bundles, unpacked_products_quantity)
  end

  def adjust_previous_bundle_package(valid_bundles, quantity)
    decrease_count_from_last_bundle_package
    last_bundle = valid_bundles.pop
    quantity - last_bundle_package_count * last_bundle.items_count
  end
end
