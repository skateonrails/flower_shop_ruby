# frozen_string_literal: true
require 'spec_helper'

describe SortedCollection do
  let(:first_bundle) { Bundle.new(value: 30.44, items_count: 5) }
  let(:second_bundle) { Bundle.new(value: 30, items_count: 2) }
  let(:bundles) { [first_bundle, second_bundle] }
  let(:reverse_sorted_bundles) { bundles.sort{|bundle_a, bundle_b| bundle_b.items_count <=> bundle_a.items_count} }
  let(:bundle_collection) { SortedCollection.new(items: bundles) }

  it 'should act as array of objects that respond to value and items_count' do
    bundle_collection.each do |bundle|
      expect(bundle).to respond_to(:value)
      expect(bundle).to respond_to(:items_count)
    end
  end

  describe '#initialize' do
    it 'order bundles by items_count' do
      expect(bundle_collection[0]).to eq(second_bundle)
      expect(bundle_collection[1]).to eq(first_bundle)
    end
  end

  describe '#less_than_or_equal_to' do
    it 'should return bundles that have an item_count less than or equal the parameter' do
      available_bundles = bundle_collection.less_than_or_equal_to(3)
      expect(available_bundles.size).to eq(1)
      expect(available_bundles.first).to eq(second_bundle)
    end
  end

  describe '#to_s' do
    it 'should return a formatted packed bundle info, in a reverse order' do
      expect(bundle_collection.to_s).to eq(reverse_sorted_bundles.map(&:to_s).join("\n"))
    end
  end
end
