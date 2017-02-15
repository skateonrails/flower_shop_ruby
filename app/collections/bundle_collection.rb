# frozen_string_literal: true
# BundleCollection class represents a collection of bundles
# It order the bundles using the items_count value of a bundle
class BundleCollection
  include Enumerable
  extend Forwardable

  def initialize(args = {})
    @bundles = args.fetch(:bundles, [])
    sort_bundles
  end

  def available_bundles_for_packing(items_count)
    found_bundles = find_all { |bundle| bundle.items_count <= items_count }
    self.class.new(bundles: found_bundles)
  end

  def to_s
    reverse_bundles.map(&:to_s).join("\n")
  end

  # delegate used methods to bundles array
  def_delegators :bundles, :<<, :[], :pop, :last, :first, :size, :empty?, :each

  private

  attr_accessor :bundles

  def sort_bundles
    @bundles = bundles.sort do |bundle_a, bundle_b|
      bundle_a.items_count.to_i <=> bundle_b.items_count.to_i
    end
  end

  def reverse_bundles
    bundles.sort do |bundle_a, bundle_b|
      bundle_b.items_count.to_i <=> bundle_a.items_count.to_i
    end
  end
end
