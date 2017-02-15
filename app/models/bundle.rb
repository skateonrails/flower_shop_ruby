# frozen_string_literal: true
# Bundle class represents a bundle for a product
class Bundle
  attr_reader :value, :items_count

  def initialize(args)
    @value = args[:value].to_f
    @items_count = args[:items_count]
  end

  def to_s
    "#{items_count} $#{ValueFormatter.currency(value)}"
  end
end
