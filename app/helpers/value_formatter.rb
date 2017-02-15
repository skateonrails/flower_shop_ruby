# frozen_string_literal: true
# ValueFormatter is a responsible to format values for to_s
# methods in classes
module ValueFormatter
  def self.currency(value)
    format('%.2f', value)
  end
end
