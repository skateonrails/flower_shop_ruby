# frozen_string_literal: true
require 'spec_helper'

describe BundleCollection do
  let(:first_bundle) { Bundle.new(value: 30.44, items_count: 5) }
  let(:second_bundle) { Bundle.new(value: 30, items_count: 2) }
  let(:bundles) { [first_bundle, second_bundle] }
  let(:bundle_collection) { BundleCollection.new(bundles: bundles) }

  context 'when using a BundleCollection' do
    it 'should retrive bundles ordered by items_count value' do
      expect(bundle_collection[0]).to eq(second_bundle)
      expect(bundle_collection[1]).to eq(first_bundle)
    end
  end

  describe '#available_bundles_for_packing' do
    it 'should return bundles that have an item_count less than or equal the parameter' do
      available_bundles = bundle_collection.available_bundles_for_packing(3)
      expect(available_bundles.size).to eq(1)
      expect(available_bundles.first).to eq(second_bundle)
    end
  end
end
