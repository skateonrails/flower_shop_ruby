# frozen_string_literal: true
require 'spec_helper'

describe Package do
  let(:value) { 30 }
  let(:items_count) { 5 }
  let(:bundle) { Bundle.new(value: value, items_count: items_count) }
  let(:count) { 6 }
  let(:package) { Package.new(bundle: bundle, count: count) }

  describe '#bundle' do
    it 'should return the bundle' do
      expect(package.bundle).to eq(bundle)
    end
  end

  describe '#count' do
    it 'should return the count of the package' do
      expect(package.count).to eq(count)
    end
  end

  describe '#value' do
    it 'should return the count value multiplied by bundle.value' do
      expect(package.value).to eq(count * bundle.value)
    end
  end
end
