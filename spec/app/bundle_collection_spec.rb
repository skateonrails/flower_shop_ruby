# frozen_string_literal: true
require 'spec_helper'

describe BundleCollection do
  let(:first_bundle) { Bundle.new(value: 30.44, itens_count: 5) }
  let(:second_bundle) { Bundle.new(value: 30, itens_count: 2) }
  let(:bundles) { [first_bundle, second_bundle] }
  let(:bundle_collection) { BundleCollection.new(bundles: bundles) }

  context 'when using a BundleCollection' do
    it 'should retrive bundles ordered by itens_count value' do
      expect(bundle_collection[0]).to eq(second_bundle)
      expect(bundle_collection[1]).to eq(first_bundle)
    end
  end
end
