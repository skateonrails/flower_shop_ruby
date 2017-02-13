# frozen_string_literal: true
require 'spec_helper'

describe Bundle do
  let(:value) { 30.44 }
  let(:items_count) { 5 }
  let(:bundle){ Bundle.new(value: value, items_count: items_count) }

  describe '#value' do
    it 'should return the value of the bundle' do
      expect(bundle.value).to eq(value)
    end
  end

  describe '#items_count' do
    it 'should return the itens count of the bundle' do
      expect(bundle.items_count).to eq(items_count)
    end
  end
end
