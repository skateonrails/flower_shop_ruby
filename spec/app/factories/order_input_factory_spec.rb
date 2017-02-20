# frozen_string_literal: true
require 'spec_helper'

describe OrderInputFactory do
  let(:filepath) { File.join(File.dirname(__FILE__), %w(.. .. input_examples example1.md)) }
  let(:input) { File.new(filepath) }

  describe '::build' do
    it 'should create a OrderInput from config' do
      expect(OrderInputFactory.build(input)).to be_a(OrderInput)
    end
  end
end
