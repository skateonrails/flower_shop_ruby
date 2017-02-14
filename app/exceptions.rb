# frozen_string_literal: true
# InvalidInputLineException is raised when a line is not parsed right
class InvalidInputLineException < StandardError; end
# PackingError is raised to control the flow for ShippingService
class PackingError < StandardError; end
# UnableToPackingError is raised when ShippingService is not able
# to pack bundles
class UnableToPackingError < StandardError; end
