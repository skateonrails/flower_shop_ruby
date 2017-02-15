# frozen_string_literal: true
# PackedBundlesCollection is a collection of Bundles on a CustomerOrderItem
# it implements Enumerable module.
class PackedBundlesCollection
  include Enumerable
  extend Forwardable

  def initialize(args = {})
    @bundles = args[:bundles] || []
  end

  def to_s
    bundles.map(&:to_s).join("\n")
  end

  # overriding enumerable methods
  def each(&block)
    bundles.each(&block)
  end

  # delegate used methods to bundles array
  def_delegators :bundles, :<<, :[], :pop, :last, :first, :size

  private

  attr_accessor :bundles
end
