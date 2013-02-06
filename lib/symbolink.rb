require 'symbolink/helper'
require 'symbolink/engine'
require 'symbolink/configuration'

module Symbolink
	def self.configuration
		@configuration ||= Symbolink::Configuration.new
	end

  # @deprected use Symbolink.confiburation.add_icons instead
	def self.add_symbols(map = {})
    configuration.add_icons(map)
	end

	def self.configure
    yield configuration if block_given?
	end
end
