# frozen_string_literal: true
# Bundle class represents a bundle for a product
class Bundle
  attr_reader :value, :itens_count

  def initialize(args)
    @value = args[:value]
    @itens_count = args[:itens_count]
  end
end
