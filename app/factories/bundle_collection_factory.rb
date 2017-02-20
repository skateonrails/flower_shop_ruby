# frozen_string_literal: true
# SortedCollectionFactory is a factory to create a SortedCollection
# from an array of hashes, as a configuration
module SortedCollectionFactory
  def self.build(config)
    bundles = config.map do |config_hash|
      Bundle.new(config_hash)
    end

    SortedCollection.new(items: bundles)
  end
end
