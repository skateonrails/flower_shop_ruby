# frozen_string_literal: true
require 'spec_helper'

describe Bundle do
  let(:value) { 30.44 }
  let(:itens_count) { 5 }
  let(:bundle){ Bundle.new(value: value, itens_count: itens_count) }

  describe '#value' do
    it 'should return the value of the bundle' do
      expect(bundle.value).to eq(value)
    end
  end

  describe '#itens_count' do
    it 'should return the itens count of the bundle' do
      expect(bundle.itens_count).to eq(itens_count)
    end
  end
end
