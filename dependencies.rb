# frozen_string_literal: true
app_path = [File.dirname(__FILE__), 'app'].freeze
require File.join(app_path, 'exceptions.rb')
require File.join(app_path, 'order_input_line.rb')
require File.join(app_path, 'order_input.rb')
require File.join(app_path, 'customer_order_item.rb')
require File.join(app_path, 'customer_order.rb')
require File.join(app_path, 'product.rb')
require File.join(app_path, 'product_storage.rb')
require File.join(app_path, 'bundle.rb')
require File.join(app_path, 'bundle_collection.rb')
# requiring factories
factories_path = app_path + %w(factories)
require File.join(factories_path, 'bundle_collection_factory.rb')
require File.join(factories_path, 'order_input_factory.rb')
