# frozen_string_literal: true
# ProductStorage class represents a collection of products
# that are in the storage/options to be sold
class ProductStorage
  attr_reader :products

  def initialize(args)
    @products = args[:products]
  end

  def find_by_code(product_code)
    products.find { |product| product.code == product_code }
  end
end
