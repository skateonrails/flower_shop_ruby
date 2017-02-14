# frozen_string_literal: true
# BundleCollection class represents a collection of bundles
# for a product instance.
# It order the bundles using the items_count value of a bundle
class BundleCollection
  include Enumerable

  def initialize(args)
    @bundles = args[:bundles].sort do |bundle_a, bundle_b|
      bundle_a.items_count.to_i <=> bundle_b.items_count.to_i
    end
  end

  # overriding enumerable methods
  def each(&block)
    bundles.each(&block)
  end

  def [](index)
    bundles[index]
  end

  private

  attr_reader :bundles
end
