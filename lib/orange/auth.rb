require 'httparty'

class Orange::Auth
	include HTTParty

	base_uri "#{Orange::BASE_URI}/oauth/v2".freeze

	class << self
		def token
			self.new.token
		end
	end

	def initialize(path: '/token')
		@path = path
	end

	def token
		body = {
			grant_type: 'client_credentials'
		}

		response = self.class.post(@path, headers: headers, body: body)

		if response.success?
			response['access_token']
		else
			response.response.error!
		end
	end

	private

		def headers
			{
				Authorization: "Basic #{ENV['ORANGE_AUTHORIZATION_TOKEN']}",
				'Content-Type': 'application/x-www-form-urlencoded',
				Accept: 'application/json'
			}
		end
end
