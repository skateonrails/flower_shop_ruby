# frozen_string_literal: true
app_root_path = [File.dirname(__FILE__), 'app'].freeze
models_path = app_root_path + %w(models)
collections_path = app_root_path + %w(collections)
factories_path = app_root_path + %w(factories)
storage_path = app_root_path + %w(storage)
# requiring common files
require File.join(app_root_path, 'exceptions.rb')
# requiring models
require File.join(models_path, 'order_input_line.rb')
require File.join(models_path, 'customer_order_item.rb')
require File.join(models_path, 'product.rb')
require File.join(models_path, 'bundle.rb')
require File.join(app_root_path, 'customer_order.rb')
# requiring collections
require File.join(collections_path, 'bundle_collection.rb')
require File.join(collections_path, 'order_input.rb')
# requiring factories
require File.join(factories_path, 'bundle_collection_factory.rb')
require File.join(factories_path, 'order_input_factory.rb')
# requiring storage
require File.join(storage_path, 'product_storage.rb')
