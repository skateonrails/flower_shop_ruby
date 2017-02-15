# frozen_string_literal: true
require 'spec_helper'

describe PackedBundlesCollection do
  let(:bundles) { [Bundle.new({}), Bundle.new({})] }
  let(:packed_bundles_collection) { PackedBundlesCollection.new(bundles: bundles) }

  it 'should act as array of objects that respond to value and items_count' do
    packed_bundles_collection.each do |bundle|
      expect(bundle).to respond_to(:value)
      expect(bundle).to respond_to(:items_count)
    end
  end

  describe '#to_s' do
    it 'should return a formatted packed bundle info' do
      expect(packed_bundles_collection.to_s).to eq(bundles.map(&:to_s).join("\n"))
    end
  end
end
