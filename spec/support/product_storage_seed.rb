# frozen_string_literal: true
# ProductStorageSeed is responsible to add products to storage for specs
class ProductStorageSeed
  class << self
    def run
      instance = ProductStorage.instance
      instance.add(roses)
      instance.add(lilies)
      instance.add(tulips)
    end

    private

    def roses_bundles_config
      [ {value: 6.99, items_count: 5}, {value: 12.99, items_count: 10} ]
    end

    def roses_bundles
      SortedCollectionFactory.build(roses_bundles_config)
    end

    def roses
      Product.new(name: 'Roses', code: 'R12', bundles: roses_bundles)
    end

    def lilies_bundles_config
      [
        {value: 9.95, items_count: 3},
        {value: 16.95, items_count: 6},
        {value: 24.95, items_count: 9}
      ]
    end

    def lilies_bundles
      SortedCollectionFactory.build(lilies_bundles_config)
    end

    def lilies
      Product.new(name: 'Lilies', code: 'L09', bundles: lilies_bundles)
    end

    def tulips_bundles_config
      [
        {value: 5.95, items_count: 3},
        {value: 9.95, items_count: 5},
        {value: 16.99, items_count: 9},
      ]
    end

    def tulips_bundles
      SortedCollectionFactory.build(tulips_bundles_config)
    end

    def tulips
      Product.new(name: 'Tulips', code: 'T58', bundles: tulips_bundles)
    end
  end
end
