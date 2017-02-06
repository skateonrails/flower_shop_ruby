# frozen_string_literal: true
# Product class represents a product in flower shop
class Product
  attr_reader :name, :code, :bundles

  def initialize(args)
    @name = args[:name]
    @code = args[:code]
    @bundles = args[:bundles]
  end
end
