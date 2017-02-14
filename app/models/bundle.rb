# frozen_string_literal: true
# Bundle class represents a bundle for a product
class Bundle
  attr_reader :value, :items_count

  def initialize(args)
    @value = args[:value]
    @items_count = args[:items_count]
  end
end
