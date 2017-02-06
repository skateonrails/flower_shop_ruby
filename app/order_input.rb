# frozen_string_literal: true
# OrderInput receives the input to create an order
class OrderInput
  attr_reader :input

  def initialize(args)
    @input = args[:input]
  end
end
