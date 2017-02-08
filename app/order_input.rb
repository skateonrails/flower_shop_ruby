# frozen_string_literal: true
# OrderInput receives the input for the order
# and transform each line into a OrderInputLine
class OrderInput
  attr_reader :input, :lines

  def initialize(args)
    @lines = []
    @input = args[:input]
    parse_lines
  end

  private

  attr_writer :lines

  def parse_lines
    input.each_line do |input_line|
      begin
        lines << OrderInputLine.new(value: input_line)
      rescue InvalidInputLineException
        # ignoring parsing errors by now
        nil
      end
    end
  end
end
