# frozen_string_literal: true
require 'singleton'

# ProductStorage class represents a collection of products
# that are in the storage/options to be sold
class ProductStorage
  include Singleton

  def initialize
    clear
  end

  def clear
    @products = {}
  end

  def add(product)
    products[product.code.to_sym] = product
  end

  def find_by_code(product_code)
    products[product_code.to_sym]
  end

  private

  attr_accessor :products
end
