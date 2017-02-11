# frozen_string_literal: true
# BundleCollectionFactory is a factory to create a BundleCollection
# from an array of hashes, as a configuration
module BundleCollectionFactory
  def self.build(config)
    bundles = config.map do |config_hash|
      Bundle.new(config_hash)
    end

    BundleCollection.new(bundles: bundles)
  end
end
