# frozen_string_literal: true
# OrderInputFactory is a factory to create a OrderInput
# from an IO (ARGF) input type
module OrderInputFactory
  def self.build(input)
    lines = []
    input.each_line do |input_line|
      begin
        lines << OrderInputLine.new(value: input_line)
      rescue InvalidInputLineException
        # ignoring parsing errors by now
        nil
      end
    end

    OrderInput.new(lines: lines)
  end
end
