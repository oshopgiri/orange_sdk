require 'httparty'

module Orange
	BASE_URI = 'https://api.orange.com'.freeze

	autoload :Error, 'orange/error'
end

require 'orange/auth'
require 'orange/sms'
