# frozen_string_literal: true
require 'spec_helper'

describe SortedCollectionFactory do
  let(:config) { [{value: 20.44, items_count: 3}, {value: 45, items_count: 4}] }

  describe '::build' do
    it 'should create a SortedCollection from config' do
      expect(SortedCollectionFactory.build(config)).to be_a(SortedCollection)
    end
  end
end
