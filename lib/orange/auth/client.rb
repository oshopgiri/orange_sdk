class Orange::Auth::Client
	include HTTParty

	base_uri "#{Orange::BASE_URI}/oauth/v2".freeze

	def initialize(path: '/token')
		@path = path
	end

	def get_token
		response = self.class.post(@path, headers: headers, body: {
			grant_type: 'client_credentials'
		})

		if response.success?
			Orange::Auth::Token.new(response: response)
		else
			raise Orange::Auth::Error.new(response: response)
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
