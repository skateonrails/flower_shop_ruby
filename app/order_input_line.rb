# frozen_string_literal: true
# OrderInputLine represents one line from order input
# it will be used to validate each line of order input
class OrderInputLine
  attr_reader :quantity, :product_code

  def initialize(args)
    @check_value = nil
    @value = args[:value]
    parse_value
  end

  private

  def parse_value
    raise InvalidInputLineException unless parsed_value
    @quantity = parsed_value[1].to_i
    @product_code = parsed_value[2]
  end

  def parsed_value
    @check_value ||= @value.match(/^(\d+)\s(\w+)$/)
    @check_value
  end
end
