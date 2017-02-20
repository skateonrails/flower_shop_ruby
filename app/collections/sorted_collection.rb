# frozen_string_literal: true
# SortedCollection class represents a collection of items
# that is sorted by items_count value
class SortedCollection
  include Enumerable
  extend Forwardable

  def initialize(args = {})
    @items = args.fetch(:items, [])
    sort_items
  end

  def less_than_or_equal_to(items_count)
    found_items = find_all { |element| element.items_count <= items_count }
    self.class.new(items: found_items)
  end

  def to_s
    reverse_items.map(&:to_s).join("\n")
  end

  # delegate used methods to items array
  def_delegators :items, :<<, :[], :pop, :last, :first, :size, :empty?, :each

  private

  attr_accessor :items

  def sort_items
    @items = items.sort do |element_a, element_b|
      element_a.items_count.to_i <=> element_b.items_count.to_i
    end
  end

  def reverse_items
    items.sort do |element_a, element_b|
      element_b.items_count.to_i <=> element_a.items_count.to_i
    end
  end
end
