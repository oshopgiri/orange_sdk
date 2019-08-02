require 'httparty'

class Orange::Auth
	include HTTParty

	base_uri "#{Orange::BASE_URI}/oauth/v2".freeze

	def self.token(path: '/token')
		headers = {
			Authorization: "Basic #{ENV['ORANGE_AUTHORIZATION_TOKEN']}",
			'Content-Type': 'application/x-www-form-urlencoded',
			Accept: 'application/json'
		}

		body = {
			grant_type: 'client_credentials'
		}

		response = self.post(path, headers: headers, body: body)

		if response.success?
			response['access_token']
		else
			response.response.error!
		end
	end
end
