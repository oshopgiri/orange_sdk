require 'httparty'

module Orange
	BASE_URI = 'https://api.orange.com'.freeze

	autoload :Error, 'orange/error'

	class << self
		attr_accessor :configuration
	end

	def self.configure
		self.configuration ||= Configuration.new
		yield(configuration)
	end

	class Configuration
		attr_accessor :authorization_token, :merchant_key

		def initialize
		end
	end
end

require 'orange/auth'
require 'orange/money'
require 'orange/sms'
