# frozen_string_literal: true
app_root_path = [File.dirname(__FILE__), 'app'].freeze

helpers_files_regexp = app_root_path + %w(helpers *.rb)
helpers_root = Dir[File.join(helpers_files_regexp)].sort
helpers_root.uniq.each { |f| require f }

models_path = app_root_path + %w(models)
collections_path = app_root_path + %w(collections)
factories_path = app_root_path + %w(factories)
storage_path = app_root_path + %w(storage)
services_path = app_root_path + %w(services)
# requiring common files
require File.join(app_root_path, 'exceptions.rb')
# requiring models
require File.join(models_path, 'order_input_line.rb')
require File.join(models_path, 'customer_order_item.rb')
require File.join(models_path, 'product.rb')
require File.join(models_path, 'bundle.rb')
require File.join(models_path, 'package.rb')
require File.join(models_path, 'customer_order.rb')
# requiring collections
require File.join(collections_path, 'bundle_collection.rb')
require File.join(collections_path, 'order_input.rb')
require File.join(collections_path, 'packed_bundles_collection.rb')
# requiring factories
require File.join(factories_path, 'bundle_collection_factory.rb')
require File.join(factories_path, 'order_input_factory.rb')
# requiring storage
require File.join(storage_path, 'product_storage.rb')
# requiring services
require File.join(services_path, 'shipping_service.rb')
