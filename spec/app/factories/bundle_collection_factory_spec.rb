# frozen_string_literal: true
require 'spec_helper'

describe BundleCollectionFactory do
  let(:config) { [{value: 20.44, items_count: 3}, {value: 45, items_count: 4}] }

  describe '::build' do
    it 'should create a BundleCollection from config' do
      expect(BundleCollectionFactory.build(config)).to be_a(BundleCollection)
    end
  end
end
