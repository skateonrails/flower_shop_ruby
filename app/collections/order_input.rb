# frozen_string_literal: true
# OrderInput is a collection of OrderInpuLine.
# it implements Enumerable module.
class OrderInput
  include Enumerable

  def initialize(args)
    @lines = args[:lines]
  end

  # overriding enumerable methods
  def each(&block)
    lines.each(&block)
  end

  private

  attr_accessor :lines
end
