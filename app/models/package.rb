# frozen_string_literal: true
# Package is a representation of bundles and it's count value
# inside an CustomerOrderItem
class Package
  attr_reader :bundle, :count

  def initialize(args)
    @bundle = args[:bundle]
    @count = args[:count].to_i
  end

  def decrease_count
    @count -= 1
  end

  def value
    return 0 unless bundle
    bundle.value * count
  end

  def items_count
    count
  end

  def to_s
    "#{count} x #{bundle}"
  end
end
